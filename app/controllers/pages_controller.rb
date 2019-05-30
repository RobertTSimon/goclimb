class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @routes = Route.all
  end

  def profile
    @user = current_user
    @routes = current_user.routes
    # binding.pry

    # respond_to do |format|
    #   format.html { render :template => "pages/profile" }
    # end
    # @user = current_user
    # @equipment = policy_scope(Equipment).order(created_at: :desc)
    # @routes = Route.where(:user_id => current_user.id)
  end
end
