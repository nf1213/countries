require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "user#{n}@example.com" }
    password 'password'
    password_confirmation 'password'
    # sequence(:name){|n| "Nicole#{n}"}
    # country_of_origin "USA"
    # age 20
    # gender "Female"
    # picture_url "http://i.imgur.com/BoBTvgC.jpg"
    # about "I love to travel. Travelling is great."
  end

end
