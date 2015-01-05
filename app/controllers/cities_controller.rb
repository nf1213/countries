class CitiesController < ApplicationController
  def index
    @cities = City.order(created_at: :desc)
    # The cities list is fixed, so no 'limit' or pagination necessary
  end

  def show
    @city = City.find(params[:id])
    @country = Country.find(@city.country_id)
    @reviews = Review.where(city_id: @city.id).page(params[:page]).per(5)
    @reviews.each do |review|
      review.update_overall_rating
    end
    @city.update_rating
  end
end
