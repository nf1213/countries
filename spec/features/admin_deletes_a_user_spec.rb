require "rails_helper"

feature "Admin deletes a user", %q(
As a site admin,
I would like to delete a user,
So that they can't troll our review site

Acceptance Criteria:
* Admin must be logged in as admin
* Admin can see a list of users and serch for users
* Admin can delete a user
* User will no longer be displayed
* Sucess message will be displayed
) do

  scenario "Admin can delete a user" do
    @admin = FactoryGirl.create(:user, admin: true)
    @user = FactoryGirl.create(:user)
    sign_in(@admin)
    visit admin_index_path
    click_on "Users"
    expect(page).to have_content @user.username
    click_on "Delete"
    expect(page).to have_content "User successfully deleted."
    expect(page).to have_content "Admin Page"
  end

  scenario "Admin can't delete themselves" do
    @admin = FactoryGirl.create(:user, admin: true)
    sign_in(@admin)
    visit admin_index_path
    click_on "Users"
    expect(page).to_not have_content "Delete"
  end

  scenario "Non-admin can't delete a user" do
    @user = FactoryGirl.build(:user, admin: true)
    sign_up(@user)
    visit admin_index_path
    expect(page).to have_content "Admins Only"
    visit admin_users_path
    expect(page).to have_content "Admins Only"
  end
end
