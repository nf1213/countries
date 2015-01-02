require "rails_helper"

feature "User views a city page", %q(
  As a world traveller,
  I would like to look at a cities page,
  So I can get info about that city and see its reviews

  Acceptance Criteria:
    * User can see wikipedia information (Extra feature)
    * User can see all the reviews of that city
    * User can see the name of the city
) do

  scenario "User goes to a city page and sees city info and reviews" do
    city = FactoryGirl.create(:city_with_reviews)
    visit country_path(city.country.id)
    click_on city.name

    expect(page).to have_content city.name
    expect(page).to have_content city.reviews.first.food_rating
    expect(page).to have_content city.reviews.first.description
  end

end
