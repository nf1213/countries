class SearchController < ApplicationController
  def search
    if params[:q]
      if params[:q] == ""
        @cities = []
        redirect_to "/search", notice: "You must input a character"
      else
        @cities = City.where("name ILIKE ?", "%#{params[:q]}%")
      end
    end
  end
end
