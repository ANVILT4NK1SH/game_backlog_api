class Game < ApplicationRecord
  validate :name, :release_date, presence: true
  validate :slug, uniqueness: true
end
