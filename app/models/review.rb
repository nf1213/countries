class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :city
  has_many :votes

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
  validates :user, presence: true,
    uniqueness: {scope: :city_id}
  validates :city, presence: true
  def star_selections
    [["1 star", 1], ["2 star", 2], ["3 star", 3], ["4 star", 4], ["5 star", 5]]
  end

  def self.stars
    ["1 star", "2 stars", "3 stars", "4 stars", "5 stars"]
  end

  def update_overall_rating
    @sum = (food_rating + culture_rating + nightlife_rating + landmark_rating + cost_rating + weather_rating) * 1.0
    @average = (@sum / 6).round(1)
    update_attributes(overall_rating: @average)
  end

  def vote_average
    sum = 0
    votes.each do |vote|
      sum += vote.value
    end
    sum
  end
end
