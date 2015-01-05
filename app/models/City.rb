class City < ActiveRecord::Base
  belongs_to :country
  validates :name, presence: true
  validates :country, presence: true

  def update_rating
    @count = 0
    @sum = 0
    Review.where(city_id: self.id).each do |review|
      @sum += review.overall_rating
      @count += 1
    end
    @count = 1 if @count == 0
    @rating = 20*@sum.to_f/@count.floor
    update_attributes(rating: @rating)
  end
end
