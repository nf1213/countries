require "rails_helper"

RSpec.describe Country do
  it { should have_many :cities }

  it { should have_valid(:name).when("Country") }
  it { should_not have_valid(:name).when("", nil) }
  it { should validate_uniqueness_of(:name) }

  it { should have_valid(:rating).when(0, 50, 100) }
  it { should_not have_valid(:rating).when(-1, 101, nil) }
end
