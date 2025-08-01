class User < ApplicationRecord
  validate :username, :email, uniqueness: true, presence: true

  has_secure_password
end
