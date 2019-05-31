class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  # before_action :set_user, only: [:follow, :unfollow]

  def home
    @routes = Route.all
  end

  def profile
    @users = User.where.not(id: current_user.id)
    @user = set_user
    @routes = @user.routes
    @trips = @user.trips
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

  def set_user
    @user = User.find(params[:id])
  end
end
