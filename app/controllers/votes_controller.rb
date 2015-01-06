class VotesController < ApplicationController
  before_action :authenticate_user!

  def create
    review = Review.find(params[:vote][:review_id])
    city = review.city
    @user = review.user
    country = city.country
    vote = Vote.new(vote_params)
    vote.user_id = current_user.id
    notice = ""
    if vote.save
      notice = "You have voted!"
      VoteMailer.welcome_email(@user).deliver_now
    else
      existing = review.votes.find_by(review_id: review.id, user_id: current_user.id)
      if existing
        if existing.value != vote.value
          existing.update(value: vote.value)
          notice = "You have voted!"
          VoteMailer.welcome_email(@user).deliver_now
        else
          notice = "You already voted!"
        end
      end
    end
    redirect_to country_city_path(country, city), notice: notice
  end

  private

  def vote_params
    params.require(:vote).permit(:value, :review_id)
  end
end
