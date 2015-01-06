class City < ActiveRecord::Base
  searchkick autocomplete: ["city"]
  belongs_to :country
  validates :name, presence: true
  validates :country, presence: true
end
