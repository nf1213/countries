require "rails_helper"

feature "User views a country page", %q(
  As a world traveller,
  I would like to be able to view a country page,
  So that I can see what cities are in that country and choose one to review

  Acceptance Criteria:
    * User can see wikipedia information about that country
    * User can see the name of the country
    * The user can see a list of cities in that country
    * The user can navigate from the country to one of the cities
) do

  scenario "User sees only cities in that country" do
    country = FactoryGirl.create(:country_with_cities)
    outside_city = FactoryGirl.create(:city)
    visit country_path(country)

    expect(page).to have_content country.name
    expect(page).to have_content country.cities.first.name
    expect(page).not_to have_content outside_city.name

  end

end
