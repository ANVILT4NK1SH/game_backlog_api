class Genre < ApplicationRecord
  validate :name, uniqueness: true, presence: true
  validate :slug, uniqueness: true
end
