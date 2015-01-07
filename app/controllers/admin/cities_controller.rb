class Admin::CitiesController < ApplicationController
  before_action :check_admin

  def check_admin
    if !current_user.admin
      redirect_to root_path, notice: "Admins Only"
    end
  end

  def index
    @cities = City.all
  end

  def show
    @city = City.find(params[:id])
    @reviews = Review.where(city_id: @city.id).page(params[:page]).per(5)
  end

  def new
    @city = City.new
  end

  def create
    @city = City.new(city_params)
    if @city.save
      redirect_to admin_cities_path, notice: "City successfully created."
    else
      render :new
    end
  end

  def destroy
    @city = City.find(params[:id])
    @city.destroy
    redirect_to admin_index_path, notice: "City successfully deleted."
  end

  private

  def city_params
    params.require(:city).permit(:country_id, :name)
  end
end
