class City < ActiveRecord::Base
  belongs_to :country
  has_many :reviews
  validates :name, presence: true
  validates :country, presence: true
  validates :rating, numericality: { only_integer: true,
    greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }
  def update_rating
    @count = 0
    @sum = 0
    Review.where(city_id: id).each do |review|
      @sum += review.overall_rating
      @count += 1
    end
    @count = 1 if @count == 0
    @rating = 20 * @sum.to_f / @count.floor
    update_attributes(rating: @rating)
  end
end
