class Country < ActiveRecord::Base
  has_many :cities
  validates :name, presence: true, uniqueness: true
  validates :rating, numericality: { only_integer: true,
    greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }
  def update_rating
    @count = 0
    @sum = 0
    City.where(country_id: id).each do |city|
      if city.rating and city.rating != 0
        @sum += city.rating
        @count += 1
      end
    end
    @count = 1 if @count == 0
    @rating = (@sum.to_f / @count.floor).to_i
    update_attributes(rating: @rating)
  end
end
