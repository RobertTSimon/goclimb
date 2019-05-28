class ReviewsController < ApplicationController
  before_action :set_review, only: [:new, :create, :edit, :destroy, :update]

  def new
    @review = Review.new
  end

  def create

  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def set_review
    @review = Review.find(params[:id])
  end
end
