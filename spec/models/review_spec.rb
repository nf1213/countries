require "rails_helper"

RSpec.describe Review do
  it { should belong_to :user }
  it { should belong_to :city }
  it { should have_many :votes }

  it { should have_valid(:city).when(City.new) }
  it { should_not have_valid(:city).when(nil) }

  it { should have_valid(:user).when(User.new) }
  it { should_not have_valid(:user).when(nil) }

  it { should have_valid(:food_rating).when(1, 5) }
  it { should_not have_valid(:food_rating).when(0, 6, nil) }

  it { should have_valid(:nightlife_rating).when(1, 5) }
  it { should_not have_valid(:nightlife_rating).when(0, 6, nil) }

  it { should have_valid(:landmark_rating).when(1, 5) }
  it { should_not have_valid(:landmark_rating).when(0, 6, nil) }

  it { should have_valid(:cost_rating).when(1, 5) }
  it { should_not have_valid(:cost_rating).when(0, 6, nil) }

  it { should have_valid(:weather_rating).when(1, 5) }
  it { should_not have_valid(:weather_rating).when(0, 6, nil) }

  it { should have_valid(:culture_rating).when(1, 5) }
  it { should_not have_valid(:culture_rating).when(0, 6, nil) }
end
