class CitiesController < ApplicationController
  def index
    @cities = City.order(created_at: :desc)
  end

  def show
    @city = City.find(params[:id])
    @country = Country.find(@city.country_id)
    @reviews = @city.reviews.order("overall_rating DESC").page(params[:page]).per(5)
    @reviews.each do |review|
      review.update_overall_rating
    end
    @city.update_rating
  end

  def destroy
    @city = City.find(params[:id])
    @city.destroy

    redirect_to admin_path, notice: "City sucessfully deleted."
  end


end
