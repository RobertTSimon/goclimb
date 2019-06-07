class JointUserTripsController < ApplicationController
  before_action :set_trip, only: [:show, :destroy, :create]

  def index
    @joint_user_trip = policy_scope(Joint_user_trip).order(created_at: :desc)
    @trips = trip.all
  end

  def new
    @joint_user_trip = JointUserTrip.new

    authorize @joint_user_trip
  end

  def update
    @joint_user_trip = JointUserTrip.find(params[:id])

    authorize @joint_user_trip

    if params[:commit] == "Refuse"
      @joint_user_trip.status = "refused"
    else
      @joint_user_trip.status = "accepted"
    end
    @joint_user_trip.save!
      redirect_to profile_path(current_user.id), notice: "trip was successfully updated!"
  end


  def create
    @joint_user_trip = JointUserTrip.new(joint_user_trip_allowed_params)
    authorize @joint_user_trip
    @joint_user_trip.status = 'pending'
    if @joint_user_trip.save!
      redirect_to profile_path(params[:user_id])
    else
      render :new
    end
  end

  def destroy
    @joint_user_trip.destroy
    redirect_to user_trip_path(@trip)
    authorize @joint_user_trip
  end

  private


  def set_trip
    @trip = Trip.find(params[:trip_id])
  end

  def joint_user_trip_allowed_params
    params.permit(:status, :user_id, :trip_id)
  end
end
