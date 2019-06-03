class RouteTripsController < ApplicationController
  def destroy
    unless RouteTrip.find(params[:id]).nil?
      @route_trip = RouteTrip.find(params[:id])
      @trip = @route_trip.trip
      # @route = Route.find(params[:route_id])
      # @trip.routes.delete(@route)
      RouteTrip.delete(@route_trip)
    end
    redirect_to trip_path(@trip)
  end
end
