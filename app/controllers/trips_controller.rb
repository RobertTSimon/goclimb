class TripsController < ApplicationController
  before_action :set_trip_by_id, only: [:show, :edit, :destroy]

  def new
    @trip = Trip.new
    authorize @trip
  end

  def create
    @trip = Trip.new(trip_params)
    authorize @trip
  end

  # I refactorized this show method, sorry. Simon
  def show
    # raise
    authorize @trip
    @user = current_user
    @routes = @trip.routes
    add_markers_and_site_geoloc if !@routes.first.nil? # add the markers and the @site_loc. Reject routes without localisation.

    @trips = []
    @trips << @user.trips
    @trips << @user.joint_user_trips.map { |jut| jut.trip }
    @trips = @trips.flatten
  end

  def destroy
    authorize @trip
  end

  def edit
    authorize @trip
  end

  def update
    @trip = current_user.next_trip
    authorize @trip

    @trip.update(trip_params)
    redirect_to trip_path(@trip)
  end

  # We can probably delete this method now (I created it). Simon.
  # def delete
  #   raise
  #   @route = Route.find(params[:id])
  #   authorize @trip
  #   @trip.routes.delete(@route)
  #   redirect_to trip_path(@trip)
  # end

  private

  def set_trip_by_next
    @trip = current_user.trips.where(state: "next").first
  end

  def set_route_by_id
    @route = Route.find(params[:id])
  end

  def set_trip_by_id
    @trip = Trip.find(params[:id])
  end


  def trip_params
    params.require(:trip).permit(:start_date, :end_date, :state)
  end

  def add_markers_and_site_geoloc
    @routes = @routes.reject do |route|
      route.latitude.nil? || route.longitude.nil?
    end
    @markers = []
    @routes.each_with_index do |route_marked, i|
      marker = {
        lat: route_marked.latitude,
        lng: route_marked.longitude,
        index: i,
        infowindow: render_to_string(partial: "infowindow", locals: { route: route_marked, index: i })
      }
      @markers << marker
      @markers_trip = @markers
    end
    route_lat = 0
    route_long = 0
    @routes.each do |route_marked|
      route_lat += route_marked.latitude
      route_long += route_marked.longitude
    end
     @trip.latitude = route_lat / @routes.count.to_f
     @trip.longitude = route_long / @routes.count.to_f
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
