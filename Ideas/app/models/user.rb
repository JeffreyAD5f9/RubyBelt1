class User < ActiveRecord::Base
  has_secure_password
  has_many :ideas
  has_many :likes
  has_many :ideas_liked, through: :likes, source: :idea

  validates :name, :email, presence: :true
  validates :password, presence: :true, on: :create
  validates :password, length: { maximum: 72 }
  validates_confirmation_of :password, message: 'Ensure that password entered matches confirmation'
end
