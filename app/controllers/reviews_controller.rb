class ReviewsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :find_review, only: [:show, :edit, :update, :destroy]

  def index
    @review = Review.all
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    if @review.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @review.update(review_params)
      redirect_to review_path(@review.id)
    else
      render :edit
    end
  end

  def destroy
    @review.destroy
    redirect_to root_path
  end

  private

  def review_params
    params.require(:review).permit(:image, :title, :date, :genre_id, :star_id, :place_id, :impression).merge(user_id: current_user.id)
  end

  def find_review
    @review = Review.find(params[:id])
  end
end
