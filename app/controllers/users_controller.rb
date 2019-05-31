class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :index]



  def show
    @user = User.find(params[:id])
    authorize @user
  end

  def edit
    authorize @user
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_allowed_params)
      flash[:notice] = "Profile has been updated"
      redirect_to profile_path
    else
      render :profile
    end
    authorize @user
  end

  private

  def user_allowed_params
    params.require(:user).permit(:username, :avatar_photo, :location, :bio, :favorite_styles, :current_level)
  end




end
