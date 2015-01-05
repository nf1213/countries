class Vote < ActiveRecord::Base
  validates :review_id,
    presence: true
  validates :user_id,
    presence: true
  validates :value,
    presence: true,
    inclusion: {in: [-1, 1]}
end
