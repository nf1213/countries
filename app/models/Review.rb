class Review < ActiveRecord::Base

  belongs_to :user
  belongs_to :city
  validates :food_rating, numericality: { only_integer: true,
    greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
  validates :culture_rating, numericality: { only_integer: true,
    greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
  validates :nightlife_rating, numericality: { only_integer: true,
    greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
  validates :landmark_rating, numericality: { only_integer: true,
    greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
  validates :cost_rating, numericality: { only_integer: true,
    greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
  validates :weather_rating, numericality: { only_integer: true,
    greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
  validates :user_id, presence: true
  validates :city_id, presence: true

  def star_selections
    [["1 star", 1], ["2 star", 2], ["3 star", 3], ["4 star", 4], ["5 star", 5]]
  end

  def self.stars
    ["1 star", "2 stars", "3 stars", "4 stars", "5 stars"]
  end

  def update_overall_rating
    @sum = (self.food_rating + self.culture_rating + self.nightlife_rating + self.landmark_rating + self.cost_rating + self.weather_rating)*1.0
    @average = (@sum/6).round(1)
    update_attributes(overall_rating: @average)
  end

end
