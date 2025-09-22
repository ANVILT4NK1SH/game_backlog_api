class User < ApplicationRecord
  has_many :likes
  has_many :owneds
  has_many :backlogs
  validates :username, :email, presence: true
  validates_uniqueness_of :username, message: "already taken"
  validates_uniqueness_of :email, message: "already registered"

  has_secure_password
end
