require "rails_helper"

RSpec.describe City do
  it { should belong_to :country }
  it { should have_many :reviews }

  it { should have_valid(:name).when("City") }
  it { should_not have_valid(:name).when("", nil) }

  it { should have_valid(:country).when(Country.new) }
  it { should_not have_valid(:country).when(nil) }

  it { should have_valid(:rating).when(0, 50, 100) }
  it { should_not have_valid(:rating).when(-1, 101) }
end
