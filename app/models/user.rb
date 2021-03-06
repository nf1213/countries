class User < ActiveRecord::Base

  GENDERS = [
    ["Not specified", "Not specified"],
    ["Male", "Male"],
    ["Female", "Female"],
  ]

  has_many :reviews
  mount_uploader :avatar, AvatarUploader

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :username,
    presence: true,
    uniqueness: true

  def unspecified_gender?
    true if self.gender == "Not specified"
  end
end
