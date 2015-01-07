class VoteMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def vote_email(review)
    @review = review
    @user = review.user
    mail(to: @user.email, subject: 'Post Upvoted')
  end

  # def welcome_email(user)
  #   @user = user
  #   mail(to: @user.email, subject: 'You have joined!')
  # end

end
