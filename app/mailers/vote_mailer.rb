class VoteMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def vote_email(review)
    @review = review
    @user = review.user
    mail(to: @user.email, subject: 'Post Upvoted')
  end
end
