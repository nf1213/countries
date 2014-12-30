require 'rails_helper'

feature "User edits a profile", %q(
  As a world traveller,
  I would like to have a profile,
  So that others can get to know me and see my reviews

  Acceptance Criteria:
    - [ ] The user can visit the edit profile page from any page(test homepage)
    -[ ] User can optionally provide their country of origin, age, gender,
      and an 'about me' section
      * Changes will be shown on their public profile
  ) do

  before(:each) do
    @user = FactoryGirl.build(:user)
    sign_up(@user)
  end

  scenario "User visits their profile from the homepage" do
    visit root_path

    click_on "Edit User Profile"

    expect(page).to have_content "Country of origin"
    expect(page).to have_content "Age"
    expect(page).to have_content "Gender"
    expect(page).to have_content "About"
    expect(page).to have_content "Editing Profile for #{@user.username.capitalize}"
  end

  scenario "User fills in all fields" do
    visit edit_user_path(User.first.id)

    fill_in "Country of origin", with: @user.country_of_origin
    fill_in "Age", with: @user.age
    fill_in "Gender", with: @user.gender
    fill_in "About", with: @user.about
    click_on "Edit Profile"

    expect(page).to have_content @user.country_of_origin
    expect(page).to have_content @user.age
    expect(page).to have_content @user.gender
    expect(page).to have_content @user.about
  end

  scenario "User fills in no fields" do
    visit edit_user_path(User.first.id)

    click_on "Edit Profile"
    expect(page).not_to have_content "Age cannot be blank"
  end

  scenario "User can't edit another users profile" do
    @user1 = User.first.id
    @user2 = FactoryGirl.create(:user)
    click_on "Sign Out"
    sign_in(@user2)
    visit edit_user_path(@user1)
    expect(page).to have_content "You're not authorized to edit this profile!"
  end

  scenario "unregistered user can't edit another users profile" do
    @user1 = User.first.id
    click_on "Sign Out"
    visit edit_user_path(@user1)
    expect(page).to have_content "You're not authorized to edit this profile!"
  end



end
