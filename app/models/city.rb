class City < ActiveRecord::Base
  belongs_to :country
  has_many :reviews
  validates :name, presence: true
  validates :country, presence: true
end
