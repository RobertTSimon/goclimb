class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  # before_action :set_user, only: [:follow, :unfollow]

  def home
    ensure_trip if user_signed_in?
    @routes = Route.all
  end

  def profile
    @users = User.where.not(id: current_user.id)
    @user = set_user
    @routes = @user.routes
    @trips = []
    @trips << @user.trips
    @trips << @user.joint_user_trips.map { |jut| jut.trip }
    @trips = @trips.flatten
    @load_trips = params[:trip] == "true"
    sort_trips
  end

  def add_follower
    @climber = User.find(params[:id])
    @current_user = current_user
    @climber.followed_by.push(current_user.id)
    @climber.save!
    @current_user.following.push(@climber.id)
    @current_user.save!
    redirect_to profile_path(@climber)
  end

  def delete_follower
    @climber = User.find(params[:id])
    @current_user = current_user
    @climber.followed_by.delete(current_user.id)
    @climber.save!
    @current_user.following.delete(@climber.id)
    @current_user.save!
    redirect_to profile_path(@climber)
  end

  private

  def ensure_trip
    if current_user.next_trip.nil?
      Trip.create(
        user: current_user,
        state: "next",
        start_date: Date.today + 1.month,
        end_date: Date.today + 1.month + 1.day
      )
    end
  end

  def sort_trips
    @next_trip = []
    @next_trip << Trip.where(state: "next").where(user: @user)
    @next_trip << @user.joint_user_trips.where(status: "accepted").map { |jut| jut.trip }
    @next_trip = @next_trip.flatten
    @old_trips = Trip.where(state: "done").where(user: @user)
    @trips = @next_trip + @old_trips
  end

  def set_user
    @user = User.find(params[:id])
  end
end
