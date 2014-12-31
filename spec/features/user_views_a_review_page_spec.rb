require "rails_helper"

feature "User views a review", %q(
  As a user,
  I would like to be able to view a review,
  So that I can see all of its details

  Acceptance Criteria:
    * I must see all the ratings
    * I must see the reviews title (if there is one)
    * I must see the user's name who posted it
) do

  before(:each) do
    @city = FactoryGirl.create(:city_with_reviews)
    @review = @city.reviews.first
  end

  scenario "User sees all the info" do
    visit country_city_review_path(@city.country.id, @city.id, @review.id)

    expect(page).to have_content @review.city
    expect(page).to have_content @review.food_rating
    expect(page).to have_content @review.user.username
  end

end
