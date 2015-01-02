require "rails_helper"

feature "User creates a review", %q(
  As a world traveller,
  I would like to review a city,
  So that others can benefit from my experience

  Acceptance Criteria:
    * User must be logged in
    * User must rate Food, Culture, Landmarks, Cost/Standard of living,
      Weather, on a 1-5 scale
    * User can optionally provide additional text with extra comments and other
      things they wish to share about their experience with the city
) do

  before(:each) do
    @user = FactoryGirl.create(:user)
    @city = FactoryGirl.create(:city)
  end

  scenario "Unauthenticated user attempts to create a reveiw" do
    visit new_country_city_review_path(@city.country.id, @city.id)

    expect(page).to have_content "You must be logged in to create a review"
  end

  scenario "User creates a review with valid attributes" do
    review = FactoryGirl.build(:review, user: @user)
    sign_in(@user)
    visit new_country_city_review_path(@city.country.id, @city.id)

    select "#{review.food_rating} star", from: "Food rating"
    select "#{review.nightlife_rating} star", from: "Nightlife rating"
    select "#{review.landmark_rating} star", from: "Landmark rating"
    select "#{review.cost_rating} star", from: "Cost rating"
    select "#{review.weather_rating} star", from: "Weather rating"
    select "#{review.culture_rating} star", from: "Culture rating"
    fill_in "Description", with: review.description

    click_on "Submit"

    expect(page).to have_content "Review was successfully created!"
    expect(page).to have_content review.description
    expect(page).to have_content "-#{@user.username}"

  end

end
