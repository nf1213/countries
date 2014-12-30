require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "user#{n}@example.com" }
    password 'password'
    password_confirmation 'password'
    sequence(:username){|n| "Nicole#{n}"}#required
    country_of_origin "USA" #optional
    age 20 #optional
    gender "Female" #ooptional
    about "I love to travel. Travelling is great." #optional
  end

end
