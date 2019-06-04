class RoutesController < ApplicationController
  before_action :set_route, only: [:show, :edit, :destroy, :update]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @routes = policy_scope(Route).order(created_at: :desc) # policy for routes
    set_index_pages1 # pages for routes cf private, begin of index

    @routes = @routes.uniq # supress double routes <!> can cause a bug with the seeds

    # Only suggest the same site of the routes of your next trip
    # if user_signed_in? && !current_user.trips.first.routes.first.nil?
    #   @routes = @routes.select do |route|
    #     route.site == current_user.trips.first.routes.first.site
    #   end
    # end

    create_references_levels # reference levels in @references and
    # sort_levels # sort the routes by level
    sort_by_level_for_user if user_signed_in?

    mark_routes_index # mark the routes with @markers. Put it at the end, jut before set index 2 please. Simon.
    set_index_pages2 # pages for routes, end of index
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

  private

  def sort_by_level_for_user
    @routes = @routes.sort_by { |route| (@references[route.level] - @references[@user.current_level]).abs }
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
  end

  def test_level_of_the_route_for_the_user
    @relative_level = @references[@route.level] - @references[current_user.current_level]
    @relative_statut = "easy for you, good warming" if @relative_level < -2
    @relative_statut = "perfect for you" if @relative_level.nil?
    @relative_statut = "too hard for now" if  @relative_level > -2
    @relative_statut = "quiete eay, do it for traing" if  @relative_level <= 2 && @relative_level.positive?
    @relative_statut = "a bit hard, good for progression" if @relative_level >= -2 && @relative_level.negative?
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
