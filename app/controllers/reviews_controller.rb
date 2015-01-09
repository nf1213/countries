class ReviewsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @reviews = Review.order(created_at: :desc)
  end

  def show
    @review = Review.find(params[:id])
    @vote = Vote.new
  end

  def new
    @country = Country.find(params[:country_id])
    @city = City.find(params[:city_id])
    @review = Review.new
  end

  def create
    @country = Country.find(params[:country_id])
    @city = City.find(params[:city_id])
    @review = Review.new(review_params)
    @review.user = current_user
    @review.city_id = @city.id

    if @review.save
      redirect_to country_city_path(@country, @city), notice: "Review was successfully created!"
    else
      render "new"
    end
  end

  def edit
    @country = Country.find(params[:country_id])
    @city = City.find(params[:city_id])
    @review = Review.find(params[:id])
    if @review.user != current_user
      redirect_to country_city_path(@country, @city), notice: "You are not authorized to edit this review"
    end
  end

  def update
    @country = Country.find(params[:country_id])
    @city = City.find(params[:city_id])
    @review = Review.find(params[:id])
    if @review.user != current_user
      redirect_to country_city_path(@country, @city), notice: "You are not authorized to edit this review"
    end
    @review.user = current_user
    @review.city_id = @city.id

    if @review.update(review_params)
      redirect_to country_city_path(@country, @city), notice: "Review succesfully updated"
    else
      render "edit"
    end
  end

  def destroy
    @country = Country.find(params[:country_id])
    @city = City.find(params[:city_id])
    @review = Review.find(params[:id])
    if @review.user != current_user || review.user.admin
      redirect_to country_city_path(@country, @city), notice: "You are not authorized to destroy this review"
    end
    @review.destroy

    redirect_to country_city_path(@country, @city), notice: "Review deleted"
  end

  private

  def review_params
    params.require(:review).permit(:city_id, :user_id, :food_rating,
    :nightlife_rating, :landmark_rating, :cost_rating, :weather_rating,
    :culture_rating, :description)
  end
end
