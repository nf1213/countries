require "rails_helper"

feature "Admin deletes a review spec", %q(
  As an admin,
  I would like to be able to delete a review,
  So that I can moderate inappropriate content

  Acceptance Criteria:
    * I must be logged in as an admin
    * I can delete a review
    * I will see a success message
) do

  before(:each) do
    @city = FactoryGirl.create(:city)
    @review = FactoryGirl.create(:review, city: @city)
  end

  scenario "Admin can delete a review" do
    admin = FactoryGirl.create(:user, admin: true)
    sign_in(admin)

    visit admin_cities_path
    click_on @city.name
    click_on "Delete Review"

    expect(page).to have_content "Review successfully deleted."
  end

  scenario "Non-admin cannot delete a review they didn't write" do
    user = FactoryGirl.create(:user)
    sign_in(user)

    visit admin_city_path(@review.city)
    expect(page).to have_content "Admins Only"
  end

end
