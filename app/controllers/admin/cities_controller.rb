module Admin
  class CitiesController < ApplicationController
    def index
      @cities = City.all
      if !current_user.admin
        flash[:notice] = "Admins Only"
        redirect_to root_path
      end
    end
  end
end
