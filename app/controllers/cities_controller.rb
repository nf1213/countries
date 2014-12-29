class CitiesController < ApplicationController
  def index
    @cities = City.order(created_at: :desc)
  end
end
