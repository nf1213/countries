require 'rails_helper'

feature "User creates a profile", %q(
  As a world traveller,
  I would like to have a profile,
  So that others can get to know me and see my reviews

  Acceptance Criteria:
    * User can optionally provide their country of origin, age, gender,
      picture_url, and an 'about me' section
    * User will have a profile page that other users can view
) do

  # before(:each) do
  #   @user = FactoryGirl.build(:user)
  #   sign_up(@user)
  # end
  #
  # scenario "User fills in all fields" do
  #
  #   visit edit_user_path
  #
  #   fill_in "Name", with: @user.name
  #   fill_in "Country of origin", with: @user.country_of_origin
  #   fill_in "Age", with: @user.age
  #   fill_in "Gender", with: @user.gender
  #   fill_in "Picture url", with: @user.picture_url
  #   fill_in "About", with: @user.about
  #
  #   click_on "Edit Profile"
  #
  # end
  #
  # scenario "User fills in no fields" do
  #   visit edit_user_path
  #
  #   click_on "Edit Profile"
  # end
  #
  # scenario "User will have a profile page that other users can view" do
  #   other_user = FactoryGirl.create(:user)
  #
  #   visit user_path(other_user.id)
  #
  #   expect(page).to have_content other_user.name
  #   expect(page).to have_content other_user.age
  # end

end
