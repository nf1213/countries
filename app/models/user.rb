class User < ActiveRecord::Base
  has_many :reviews
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :username,
    presence: true,
    uniqueness: true

  def self.genders
    [["Not specified", "Not specified"],
     ["Male", "Male"],
     ["Female", "Female"],
     ["Other", "Other"]]
  end
end
