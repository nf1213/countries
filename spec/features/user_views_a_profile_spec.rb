require "rails_helper"

feature "User views a profile", %q(
  As a user,
  I want to be able to view a users profile,
  So that I can learn more about them

  Acceptance Criteria
    * I should see their username
    * I should see all of the reviews (if any) they created
) do

  before(:each) do
    @user = FactoryGirl.create(:user)
  end

  scenario "User will have a profile page that other users can view" do
    visit user_path(@user)

    expect(page).to have_content @user.username
    expect(page).to have_content @user.country_of_origin
    expect(page).to have_content @user.gender
  end

  scenario "user will see all of the reviews that they created" do
    @review = FactoryGirl.create(:review, user: @user)
    visit user_path(@user.id)
    expect(page).to have_content @review.description
  end

  scenario "user will not see a gender if the user chose not specified" do
    user = FactoryGirl.create(:user, gender: "Not specified")
    visit user_path(user)

    expect(page).to have_content user.username
    expect(page).not_to have_content user.gender
  end
end
