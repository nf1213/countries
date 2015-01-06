class Vote < ActiveRecord::Base
  belongs_to :review
  belongs_to :user

  validates :review_id,
    presence: true,
    uniqueness: { scope: :user_id }
  validates :user_id,
    presence: true,
    uniqueness: { scope: :review_id }
  validates :value,
    presence: true,
    inclusion: {in: [-1, 1]}
end
