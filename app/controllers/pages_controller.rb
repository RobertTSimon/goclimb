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
  end

  def follow
    if current_user.follow(@user.id)
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js
      end
    end
  end

  def unfollow
    if current_user.unfollow(@user.id)
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js { render action: :follow }
      end
    end
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

  private

  def set_user
    @user = User.find(params[:id])
  end
end
