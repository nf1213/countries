require "rails_helper"

feature "User votes for a review", %q(
  As a user,
  I would like to be able to upvote or downvote a review
  So that others can see which reviews are the most helpful

  Acceptance Criteria:
    * I must be logged in
    * I can choose up or down
    * I can only vote for a review once, but I can change my review from up to
      to down or vise vers
) do

  before(:each) do
    @review = FactoryGirl.create(:review)
    @city = @review.city
    @country = @city.country
  end

  scenario "an unauthorized user tries to vote" do

  end

  scenario "a user successfully votes" do

  end

  scenario "a user changes their vote" do

  end

  scenario "a user tries to upvote twice" do

  end

end
