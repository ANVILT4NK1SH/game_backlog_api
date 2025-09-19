class User < ApplicationRecord
  has_many :likes
  has_many :owneds
  has_many :backlogs
  validates :username, :email, uniqueness: true, presence: true

  has_secure_password
end
