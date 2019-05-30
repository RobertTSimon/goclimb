class RoutesController < ApplicationController
  before_action :set_route, only: [:show, :edit, :destroy, :update]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @routes = policy_scope(Route).order(created_at: :desc)
    @previous_page = "/routes?page=#{params[:page].to_i - 1}"
    @next_page = "/routes?page=#{params[:page].to_i + 1}"
    @current_page_link = "/routes?page=#{params[:page].to_i}"
    @current_page = params[:page].to_i

    if params[:query].present?
      @routes = Route.order(id: :asc).search(params[:query])
      # Navigate through pages with query. Diego
      @previous_page += "&query=#{params[:query]}"
      @next_page += "&query=#{params[:query]}"
      @current_page_link = "&query=#{params[:query]}"
    else
      @routes = Route.all
    end

    @the_end = false

    if params[:page]
      @list_routes = @routes[(params[:page].to_i  ) * 5, 5] # to optimize, should be in the sql query rather then a subset of .all
      @the_end = @routes[(params[:page].to_i + 1) * 5, 5].empty?
    else
      @list_routes = @routes[0, 5]
    end

    @routes_marked = @routes.reject do |route|
      route.latitude.nil? || route.longitude.nil?
    end

    @markers = @routes_marked.map do |route_marked|
      {
        lat: route_marked.latitude,
        lng: route_marked.longitude
      }
    end


    respond_to do |format|
      format.html
      format.js  # <-- idem
    end
  end

  def new
    @route = Route.new
    authorize @route
    # @route_attachment = @route.route_attachments.build
  end

  def create
    @route = Route.new(route_params)
    if route.save
      redirect route_path(@route)
    else
      render :new
    end
  end

  def show
    set_route
    unless (@route.latitude.nil? || @route.longitude.nil?)
      @markers = [{ lat: @route.latitude, lng: @route.longitude }]
    end
    @review = Review.new
    authorize @route
  end

  def destroy
    set_route
    authorize @route
  end

  def edit
    authorize @route
  end

  def update
    authorize @route
  end

  private

  def set_route
    @route = Route.find(params[:id])
  end

  def route_params
    route.permit(:route).require(:name, :longitude, :latitude, :description, :type, :style, :level, :rating, :page)
  end
end
