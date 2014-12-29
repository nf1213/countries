class ReviewsController < ApplicationController
  def index
    @reviews = Review.order(created_at: :desc)
  end

  def show
    @review = Review.find(params[:id])
  end

  def new
  end

  def create
    @review = Review.new(review_params)

    if @review.save
      redirect_to @review
    else
      render 'new'
    end
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])

    if @review.update(review_parameters)
      redirect_to @review
    else
      render 'edit'
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy

    redirect_to country_city_reviews_path
  end

  private
  def review_params
    params.require(:review).permit(:city_id, :user_id, :food_rating, :nightlife_rating, :landmark_rating, :cost_rating, :weather_rating, :culture_rating)
  end
end
