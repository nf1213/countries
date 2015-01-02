require "rails_helper"

feature "User deletes their review", %q(
  As a world traveler,
  I want to delete a review that I created,
  so that people cannot see the review anymore

  Acceptance Criteria:
    * User must be logged in
    * User cannot delete a review they do not own
    * User can delete a review they own
    * Review will no longer be displayed
) do

  before(:each) do
    @city = FactoryGirl.create(:city)
    @review = FactoryGirl.create(:review)
    @user = FactoryGirl.create(:user)
  end

  scenario "Unauthenticated user tries to delete a review" do
    visit edit_country_city_review_path(@city.country.id, @city.id, @review.id)

    expect(page).not_to have_content "Delete"
  end

  scenario "Unauthorized user tries to delete a review" do
    sign_in(@user)

    visit edit_country_city_review_path(@city.country.id, @city.id, @review.id)

    expect(page).not_to have_content "Delete"
  end

  scenario "User deletes their own review" do
    @review = FactoryGirl.create(:review, user: @user)
    sign_in(@user)

    visit edit_country_city_review_path(@city.country.id, @city.id, @review.id)

    click_on "Delete Review"

    expect(page).to have_content "Review deleted"
  end

end
