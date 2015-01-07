class Admin::CitiesController < ApplicationController
  def index
    @cities = City.all
    if !current_user.admin
      flash[:notice] = "Admins Only"
      redirect_to root_path
    end
  end

  def create

  end
  def new
    @city = City.new
  end

  def destroy
    if !current_user.admin
      flash[:notice] = "Admins Only"
      redirect_to root_path
    else
      @city = City.find(params[:id])
      @city.destroy
      redirect_to admin_index_path
      flash[:notice] = "City sucessfully deleted."
    end
  end
end
