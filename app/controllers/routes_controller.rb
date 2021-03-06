class RoutesController < ApplicationController
  before_action :set_route, only: [:show, :edit, :destroy, :update]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    create_references_levels # reference levels in @references and
    @routes = policy_scope(Route).order(created_at: :desc) # policy for routes
    set_index_pages1 # pages for routes cf private, begin of index

    if user_signed_in? && current_user.next_trip.routes.first.nil?
      sort_by_level_for_user
    elsif user_signed_in? && !current_user.next_trip.routes.first.nil?
      set_loc_site
      sort_punderated
    end

    set_index_pages2 # pages for routes, end of index

    unless request.format.to_s == "text/javascript"
      mark_routes_index # mark the routes with @markers. Put it at the end, jut before set index 2 please. Simon.
    end
  end

  def new
    @route = Route.new
    authorize @route
    @photo = @route.photos.build
  end

  def create
    @route = Route.new(route_params)
    @route.user = current_user
    authorize @route
    if params[:photos]
      params[:photos]['photo'].each do |image_url|
        @route.photos.new(photo: image_url, imageable_id: @route.id, imageable_type: "route")
      end
    end
    if @route.save
      redirect_to route_path(@route)
    else
      @route.photos.build if @route.photos.length.zero?
      render :new
    end
  end

  def show
    set_route
    @markers = [{ lat: @route.latitude, lng: @route.longitude }] unless @route.latitude.nil? || @route.longitude.nil?
    @markers_trip = @markers
    @review = Review.new
    authorize @route
    create_references_levels
    test_level_of_the_route_for_the_user if user_signed_in?
  end

  def destroy
    authorize @route
    @route.delete
    redirect_to profile_path(current_user)
  end

  def edit
    authorize @route
  end

  def update
    authorize @route
    if params[:photos]
      params[:photos]['photo'].each do |image_url|
        @route.photos.new(photo: image_url, imageable_id: @route.id, imageable_type: "route")
      end
    end
    if @route.update(route_params)
      redirect_to route_path(@route)
    else
      @route.photos.build if @route.photos.length.zero?
      render :edit
    end
  end

  def mark_as_fixed
    @route = Route.find(params[:id])
    authorize @route

    @route.reviews.update(fixed: true)
  end

  private

  def set_loc_site
    trip_lat = 0
    trip_long = 0
    current_user.next_trip.routes.each do |route_marked|
      trip_lat += route_marked.latitude
      trip_long += route_marked.longitude
    end
    current_user.next_trip.update(latitude: trip_lat / current_user.next_trip.routes.count)
    current_user.next_trip.update(longitude: trip_long / current_user.next_trip.routes.count)
  end

  def sort_by_level_for_user
    @routes = @routes.sort_by { |route| (@references[route.level] - @references[current_user.current_level]).abs }
  end

  def sort_distance
    @routes = @routes.sort_by { |route| dist(route, current_user.next_trip) }
  end

  def sort_punderated
    @routes = @routes.sort_by { |route| dist(route, current_user.next_trip) + (@references[route.level] + 2000 * @references[current_user.current_level]).abs }
  end

  def sort_levels
    easy = []
    hard = []
    @routes.each do |route|
      easy << route if route.level.chars.third != '1' && !easy.include?(route)
      hard << route if route.level.chars.third == '1' && !hard.include?(route)
    end
    @routes = easy.sort_by { |route| route.level } + hard.sort_by { |route| route.level }
  end

  def set_route
    @route = Route.find(params[:id])
  end

  def route_params
    params.require(:route).permit(:name, :longitude, :latitude, :description, :type, :style, :level, :rating, :page)
  end

  def mark_routes_index
    @routes = @routes.reject do |route| # Only keep localized routes
      route.latitude.nil? || route.longitude.nil?
    end
    @markers = []
    @routes.each_with_index do |route_marked, i| # add the markers
      marker = {
        lat: route_marked.latitude,
        lng: route_marked.longitude,
        infowindow: render_to_string(partial: "infowindow", locals: { route: route_marked, pag: (i.to_f / 5.0).floor })
      }
      @markers << marker
    end
    if user_signed_in? && !current_user.next_trip.routes.first.nil?
      @markers_trip = []
      current_user.next_trip.routes.each_with_index do |route_marked, i| # add the markers_trip
        marker = {
          lat: route_marked.latitude,
          lng: route_marked.longitude,
          infowindow: render_to_string(partial: "infowindow", locals: { route: route_marked, pag: (i.to_f / 5.0).floor })
        }
        @markers_trip << marker
      end
    else
      @markers_trip = @markers
    end
  end

  def test_level_of_the_route_for_the_user
    @relative_level = @references[@route.level] - @references[current_user.current_level]
    @relative_statut = "Easy for you, ideal as a good warm-up to start off" if @relative_level < -3
    @relative_statut = "Suits your skills, keep it cool" if @relative_level == 0
    @relative_statut = "This route might be too hard for you right now. You might want to improve your skills first" if  @relative_level > 3
    @relative_statut = "Easy ascent, good workout" if @relative_level <= 3 && @relative_level.positive?
    @relative_statut = "Challenging route, it should help you in getting better!" if @relative_level >= -3 && @relative_level.negative?
  end

  def set_index_pages1
    @previous_page = "/routes?page=#{params[:page].to_i - 1}"
    @next_page = "/routes?page=#{params[:page].to_i + 1}"
    @current_page_plus2 = "/routes?page=#{params[:page].to_i + 2}"
    @current_page_link = "/routes?page=#{params[:page].to_i}"
    @current_page = params[:page].to_i
    if params[:query].present?
      @routes = Route.order(id: :asc).search(params[:query])
      # Navigate through pages with query. Diego
      @previous_page += "&query=#{params[:query]}"
      @next_page += "&query=#{params[:query]}"
      @current_page_plus2 += "&query=#{params[:page]}"
      @current_page_link += "&query=#{params[:query]}"
    else
      @routes = Route.all
    end
  end

  def dist(route1, route2)
    Math.acos(Math.sin(route1.latitude) * Math.sin(route2.latitude) + Math.cos(route1.latitude) * Math.cos(route2.latitude) * Math.cos(route2.longitude - route1.longitude)) * 6371
  end

  def set_index_pages2
    @the_end = false
    if params[:page]
      @list_routes = @routes[params[:page].to_i * 5, 5] # to optimize, should be in the sql query rather then a subset of .all
      @the_end = @routes[(params[:page].to_i + 1) * 5, 5].nil?
    else
      @list_routes = @routes[0, 5]
    end
    respond_to do |format|
      format.html
      format.js # <-- idem
    end
  end
end
