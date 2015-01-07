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

  scenario "Admin can delete a review" do

  end

  scenario "Non-admin cannot delete a review they didn't write" do

  end

end
