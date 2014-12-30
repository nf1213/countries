class UsersController < ApplicationController
  before_action :get_user, only: [:show, :edit, :update]

  def get_user
    @user = User.find(params[:id])
  end

  def show

  end

  def edit
    if current_user
      if current_user.id != @user.id
        redirect_to @user, notice: "You're not authorized to edit this profile!"
      end
    else
      redirect_to @user, notice: "You're not authorized to edit this profile!"
    end
  end

  def update
    @user.update(user_params)
    if @user.save
      redirect_to @user, notice: "User Profile Updated"
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:country_of_origin, :gender, :age, :about)
  end
end
