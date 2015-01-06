class CountriesController < ApplicationController
  def show
    @country = Country.find(params[:id])
    @cities = City.where(country_id: params[:id]).order("name")
    @country.update_rating
  end
  def index
    if params[:q]
      if params[:q] == ""
        redirect_to "/", notice: "You must input a character"
      else
        @city = params[:q]
        redirect_to :controller => "search", :action => "search", :q => @city
      end
    end

  end
end
