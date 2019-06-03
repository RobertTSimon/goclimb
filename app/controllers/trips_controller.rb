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

    site_lat = 0
    site_long = 0
    @routes_marked.each do |route_marked|
      site_lat += route_marked.latitude
      site_long += route_marked.longitude
    end

    @site_loc = { lat: site_lat / @routes_marked.count.to_f, long: site_long / @routes_marked.count.to_f }
  end

  def destroy
    authorize @trip
  end

  def edit
    authorize @trip
  end

  def update
    @trip = current_user.trips.first
    authorize @trip
    @trip.update(trip_params)
    @route = Route.find(params[:id])
    @trip.routes += [@route]
    redirect_to trip_path(@trip)
  end

  def delete
    @trip = current_user.trips.first
    @route = Route.find(params[:id])
    @trip.routes.delete(@route)
    authorize @trip
    redirect_to trip_path(@trip)
  end

  private

  def set_trip
    @trip = current_user.trips.first
  end

  def trip_params
    params.require(:trip).permit(:start_date, :end_date)
  end

  def optimization_way_by_distance
    @trip.routes = recursive([], @trip.routes)
  end

  def recursive(way, left)
    r = recursive(way + [left.first], left.delete_at(0))

    return [way, dist_tot(way)] if left == []

    left.each_at_index do |l, i|
      try = recursive(way + [l], left.delete_at(i))
      r = try if try.last < r.last
    end
  end

  def dist_tot(routes)
    d = 0
    routes.each_with_index do |r, i|
      d += dist(r, r[i + 1]) if r != routes.last
    end
  end

  def dist(route1, route2)
    Math.acos(Math.sin(route1.latitude) * Math.sin(route2.latitude) + Math.cos(route1.latitude) * Math.cos(route2.latitude) * Math.cos(route2.longitude - route1.longitude)) * 6371
  end
end
