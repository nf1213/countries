class CitiesController < ApplicationController
  def index
    @cities = City.order(created_at: :desc)
  end

  def show
   @city = City.find_by(id: params[:id])
   @reviews = Review.where(city_id: @city.id)
  end
end
