require 'rails_helper'

feature 'user signs in', %Q{
  As a signed up user
  I want to sign in
  So that I can see my profile photo and change it
} do

  before(:each) do
    @user = FactoryGirl.create(:user)
    sign_in(@user)
  end

  scenario "User has default profile photo" do
    visit root_path

    click_on "Edit User Profile"

    click_on "Edit Profile"

    expect(page).to have_selector("img[src$='cat.png']")
  end

  scenario "User changes profile photo" do

    visit root_path

    click_on "Edit User Profile"

    attach_file "Add a Photo", "./app/assets/images/dog.png"

    click_on "Edit Profile"

    expect(page).to have_selector("img[alt$='avatar']")
  end

end
