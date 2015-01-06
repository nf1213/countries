class Country < ActiveRecord::Base
  has_many :cities
  validates :name, presence: true, uniqueness: true

  def update_rating
    @count = 0
    @sum = 0
    City.where(country_id: id).each do |city|
      if city.rating != 0
        @sum += city.rating
        @count += 1
      end
    end
    @count = 1 if @count == 0
    @rating = @sum.to_f / @count.floor
    update_attributes(rating: @rating)
  end
end
