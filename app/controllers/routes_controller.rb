class RoutesController < ApplicationController
  before_action :set_route, only: [:show, :edit, :destroy, :update]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @routes = policy_scope(Route).order(created_at: :desc)
    if params[:query].present?
      @routes = Route.search(params[:query])
    else
      @routes = Route.all
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
