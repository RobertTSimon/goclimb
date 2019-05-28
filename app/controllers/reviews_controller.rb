class ReviewsController < ApplicationController
  before_action :set_review, only: [:new, :create, :edit, :destroy, :update]

  def new
  end

  def create
  end

  def edit
  end

  def destroy
  end

  def update
  end


  private

  def set_review
    @review = Review.find(params[:id])
  end

end
