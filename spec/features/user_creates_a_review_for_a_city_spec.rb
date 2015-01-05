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
    visit new_country_city_review_path(@city.country, @city)

    expect(page).to have_content "You need to sign in or sign up before continuing."
  end

  scenario "User creates a review with valid attributes" do
    review = FactoryGirl.build(:review, user: @user)
    sign_in(@user)
    visit new_country_city_review_path(@city.country, @city)

    choose "review_food_rating_#{review.food_rating}"
    choose "review_nightlife_rating_#{review.nightlife_rating}"
    choose "review_landmark_rating_#{review.landmark_rating}"
    choose "review_cost_rating_#{review.cost_rating}"
    choose "review_weather_rating_#{review.weather_rating}"
    choose "review_culture_rating_#{review.culture_rating}"
    save_and_open_page
    fill_in "Description", with: review.description

    click_on "Submit"

    expect(page).to have_content "Review was successfully created!"
    expect(page).to have_content review.description
    expect(page).to have_content "Posted by: #{@user.username}"

  end

end
