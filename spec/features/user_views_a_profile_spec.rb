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
    expect(page).to have_content @user.age
  end

  # scenario "user will see all of the reviews that "
  #   visit user_path(@user.id)
  #
  #   @reviews = Review.create
  #   expect(page).to have_content @user.reviews.first.title
  # end
end
