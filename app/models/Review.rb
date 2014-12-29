class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :city
  validates :food_rating, numericality: {less_than_or_equal_to: 5}
  validates :culture_rating, numericality: {less_than_or_equal_to: 5}
  validates :nightlife_rating, numericality: {less_than_or_equal_to: 5}
  validates :landmark_rating, numericality: {less_than_or_equal_to: 5}
  validates :cost_rating, numericality: {less_than_or_equal_to: 5}
  validates :weather_rating, numericality: {less_than_or_equal_to: 5}
  validates :user_id, presence: true
  validates :city_id, presence: true

end
