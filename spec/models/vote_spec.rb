require "rails_helper"

RSpec.describe Vote do
  it { should belong_to :review }
  it { should belong_to :user }

  it { should have_valid(:value).when(-1, 1) }
  it { should_not have_valid(:value).when(0, nil, 2) }

  it { should have_valid(:review).when(Review.new) }
  it { should_not have_valid(:review).when(nil) }

  it { should have_valid(:user).when(User.new) }
  it { should_not have_valid(:user).when(nil) }
end
