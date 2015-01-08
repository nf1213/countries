require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:username) { |n| "Nicole#{n}" } # required
    sequence(:email) { |n| "user#{n}@example.com" }
    password 'password'
    password_confirmation 'password'
    country_of_origin "USA" # optional
    gender "Female" # optional
    about "I love to travel. Travelling is great." # optional
    admin false
  end

  factory :review do
    food_rating 1
    nightlife_rating 2
    landmark_rating 3
    cost_rating 4
    weather_rating 5
    culture_rating 3
    overall_rating 0
    sequence(:description) { |n| "#{n}the house with the place of the city." }
    user
    city
  end

  factory :city do
    sequence(:name) { |n| "Space Boston#{n}" }
    country
    rating 0
  end

  factory :country do
    sequence(:name) { |n| "Space Massachussettes#{n}" }
    rating 0

    factory :country_with_cities do

      transient do
        cities_count 5
      end

      after(:create) do |country, evaluator|
        create_list(:city, evaluator.cities_count, country: country)
      end
    end
  end



end
