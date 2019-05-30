class TripsController < ApplicationController
  before_action :set_trip, only: [:show, :edit, :destroy, :update]

  def new
    @trip = Trip.new
    authorize @trip
  end

  def create
    authorize @trip
  end

  def show
    authorize @trip
    @routes = @trip.routes
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

  def destroy
    authorize @trip
  end

  def edit
    authorize @trip
  end

  def update
    @trip = current_user.trips.first
    @route = Route.find(params[:id])
    @trip.routes += [@route]
    authorize @trip
    redirect_to trip_path(@trip)
  end

  private

  def set_trip
    @trip = current_user.trips.first
  end
end
