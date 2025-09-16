class User < ApplicationRecord
  has_many :likes
  has_many :owneds
  validates :username, :email, uniqueness: true, presence: true

  has_secure_password
end
