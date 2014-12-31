class UsersController < ApplicationController
  before_action :get_user, only: [:show, :edit, :update, :can_edit]
  before_action :can_edit, only: [:edit, :update]
  def get_user
    @user = User.find(params[:id])
  end

  def can_edit
    if current_user
      if current_user != @user
        redirect_to @user, notice: "You're not authorized to edit this profile!"
      end
    else
      redirect_to @user, notice: "You're not authorized to edit this profile!"
    end
  end

  def show
  end

  def edit
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
