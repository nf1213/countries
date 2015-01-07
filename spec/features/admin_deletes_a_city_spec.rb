require "rails_helper"

feature "Admin deletes a city", %q(
As a site admin,
I would like to delete a city,
So that others can't see it

Acceptance Criteria:
* Admin must be logged in as admin
* Admin can delete a city
* city will no longer be displayed
* sucess message will be displayed
) do

  scenario "Admin can delete a city" do
    @admin = FactoryGirl.create(:user, admin: true)
    @country = FactoryGirl.create(:country)
    @city = FactoryGirl.create(:city, country: @country)
    sign_in(@admin)
    visit admin_index_path
    click_on "Cities"
    expect(page).to have_content @city.name
    click_on "Delete"
    expect(page).to have_content "City successfully deleted."
    expect(page).to have_content "Admin Page"
  end

  scenario "Non-admin can't delete a city" do
    @user = FactoryGirl.build(:user, admin: true)
    sign_up(@user)
    visit admin_index_path
    expect(page).to have_content "Admins Only"
    visit admin_cities_path
    expect(page).to have_content "Admins Only"
  end
end
