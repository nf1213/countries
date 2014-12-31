class CountriesController < ApplicationController
  def show
    @country = Country.find(params[:id])
    @cities = City.where(country_id: params[:id]).order("name")
  end
end
