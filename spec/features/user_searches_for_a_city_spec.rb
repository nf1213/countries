require "rails_helper"

feature "User searches for a city", %q(
  As a world traveller,
  I would like to search for a city,
  So that I can easily find what I am looking for
  Acceptance Criteria:
    * User must input at least one character in search bar
) do

  before(:each) do
    @city = FactoryGirl.create(:city)
  end


  scenario "User searches for a city with valid attributes" do

    visit '/'

    fill_in 'q', with: 'Space'

    click_on "Search"

    expect(page).to have_content "Space Boston"

  end


  scenario "User searches for a city with invalid attributes" do

    visit '/'

    fill_in 'q', with: ''

    click_on "Search"

    expect(page).to have_content "You must input a character"

  end

end
