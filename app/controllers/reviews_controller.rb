class ReviewsController < ApplicationController
  before_action :set_route, only: [:create]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @review = policy_scope(Review).order(created_at: :desc)
    @reviews = Review.all
  end

  def show
    authorize @review
  end

  def new
    @review = Review.new
    authorize @review
  end

  def create
    @review = Review.new(params_review)
    @review.user = current_user
    @review.route = @route

    authorize @review

    if @review.save
      respond_to do |format|
        format.html { redirect_to route_path(@route) }
        format.js  # <-- will render `app/views/reviews/create.js.erb`
      end
    else
      respond_to do |format|
        format.html { render 'routes/show' }
        format.js  # <-- idem
      end
    end
  end

  def destroy
    @review = Review.find(params[:id])

    @review.destroy
    authorize @review
    respond_to do |format|
      format.html { redirect_to route_path(@review.route) }
      format.js # <-- idem
    end
  end

  def mark_as_fixed
    @review = Review.find(params[:id])
    @review.fixed = true
    @review.save!

    authorize @review
  end

  private

  def set_route
    @route = Route.find(params[:route_id])
  end

  def params_review
    params.require(:review).permit(:route_id, :user_id, :title, :description, :rating, :alert)
  end
end
