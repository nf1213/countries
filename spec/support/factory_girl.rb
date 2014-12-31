require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:username) { |n| "Nicole#{n}" } # required
    sequence(:email) { |n| "user#{n}@example.com" }
    password 'password'
    password_confirmation 'password'
    country_of_origin "USA" # optional
    age 20 # optional
    gender "Female" # optional
    about "I love to travel. Travelling is great." # optional
  end

  # factory :review do
  #   food_rating 1
  #   nighlife_rating 2
  #   landmark_rating 3
  #   cost_rating 4
  #   weather_rating 5
  #   culture_rating 3
  #   description "the house with the place of the city of the french people"
  #
  #   user
  #   city
  # end

  # factory :city do
  #   food_rating 1
  #   nighlife_rating 2
  #   landmark_rating 3
  #   cost_rating 4
  #   weather_rating 5
  #   culture_rating 3
  #   description "the house with the place of the city of the french people"
  #
  #   user
  #   city
  # end
  #
  # factory :country do
  #   food_rating 1
  #   nighlife_rating 2
  #   landmark_rating 3
  #   cost_rating 4
  #   weather_rating 5
  #   culture_rating 3cre
  #   description "the house with the place of the city of the french people"
  #
  #   user
  #   city
  # end



end
