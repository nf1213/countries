require "rails_helper"

feature "Admin adds a city", %q(
As a site admin,
I would like to add a city,
So that others can see it

Acceptance Criteria:
* Admin must be logged in as admin
* Admin can add a city
* city will be displayed
* sucess message will be displayed
) do

  scenario "Admin can add a city" do
    @admin = FactoryGirl.create(:user, admin: true)
    @country = FactoryGirl.create(:country)
    @city = FactoryGirl.build(:city, country: @country)
    sign_in(@admin)
    visit admin_index_path
    click_on "Cities"
    click_on "Add City"
    select @country.name, from: "Country"
    fill_in "Name", with: @city.name
    click_on "Create City"
    expect(page).to have_content "City sucessfully added."
    expect(page).to have_content "Admin Page"
  end

  scenario "Non-admin can't add a city" do
    @user = FactoryGirl.build(:user, admin: true)
    sign_up(@user)
    visit new_admin_city_path
    expect(page).to have_content "Admins Only"
  end
end
