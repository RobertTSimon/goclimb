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
  end

  def destroy
    authorize @trip
  end

  def edit
    authorize @trip
  end

  def update
    authorize @trip
  end

  private

  def set_trip
    @trip = Trip.find(params[:id])
  end
end
