class RouteTripsController < ApplicationController
  def destroy
    unless RouteTrip.find(params[:id]).nil?
      @route_trip = RouteTrip.find(params[:id])
      authorize @route_trip
      @trip = @route_trip.trip
      # @route = Route.find(params[:route_id])
      # @trip.routes.delete(@route)
      RouteTrip.delete(@route_trip)
    end
    redirect_to trip_path(@trip)
  end

  # POST /routes/:route_id/route_trips
  def create
    @trip = current_user.next_trip
    @route = Route.find(params[:route_id])
    @route_trip = RouteTrip.new(trip: @trip, route: @route)

    authorize @route_trip
    @route_trip.save

    redirect_to trip_path(@trip)
  end
end
