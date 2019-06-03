class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  include Pundit

  # Pundit: white-list approach.
  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  # Uncomment when you *really understand* Pundit!
  # rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  # def user_not_authorized
  #   flash[:alert] = "You are not authorized to perform this action."
  #   redirect_to(root_path)
  # end

  private

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end

  def create_references_levels
    easy = []
    hard = []
    Route.all.each do |route|
      easy << route.level if route.level.chars.third != '1' && !easy.include?(route.level)
      hard << route.level if route.level.chars.third == '1' && !hard.include?(route.level)
    end
    User.all.each do |user|
      easy << user.current_level if user.current_level.chars.third != '1' && !easy.include?(user.current_level)
      hard << user.current_level if user.current_level.chars.third == '1' && !hard.include?(user.current_level)
    end
    @levels = easy.sort + hard.sort
    @references = {}
    @levels.each_with_index do |level, index|
      @references[level] = index
    end
  end
end
