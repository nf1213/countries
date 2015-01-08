require "rails_helper"

RSpec.describe User do
  it { should have_many :reviews }

  it { should have_valid(:username).when("usr") }
  it { should_not have_valid(:username).when("", nil) }
  it { should validate_uniqueness_of(:username) }
end
