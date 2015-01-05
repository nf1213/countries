require "rails_helper"

feature "User edits their review", %q(
  As a world traveller,
  I would like to be able to edit my reviews,
  So that I can fix my mistakes and save myself from embarrassment

  Acceptance Criteria:
    * User can edit any of their ratings or their comment
    * The review will be updated
) do

  before(:each) do
    @city = FactoryGirl.create(:city)
    @review = FactoryGirl.create(:review, city: @city)
  end

  scenario "Unauthenticated user tries to edit a review" do
    # visit country_city_review_path(@city.country.id, @city.id, @review.id)
    #
    # expect(page).not_to have_content "Edit Review"

    visit edit_country_city_review_path(@city.country, @city, @review)

    expect(page).to have_content "You need to sign in or sign up before continuing."
  end

  scenario "Unauthorized user tries to edit a review" do
    user = FactoryGirl.create(:user)
    sign_in(user)

    visit edit_country_city_review_path(@city.country, @city, @review)

    expect(page).to have_content "You are not authorized to edit this review"
  end

  scenario "User edits their own review" do
    user = FactoryGirl.create(:user)
    @review = FactoryGirl.create(:review, user: user)
    sign_in(user)

    visit edit_country_city_review_path(@city.country, @city, @review)

    choose "review_food_rating_5"
    choose "review_food_rating_1"
    fill_in "Description", with: "An edited review"

    click_button "Submit"

    expect(page).to have_content "Review succesfully updated"
    expect(page).to have_content "An edited review"
  end
end
