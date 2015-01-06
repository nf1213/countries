class CitiesController < ApplicationController
  def index
    @cities = City.order(created_at: :desc)
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
