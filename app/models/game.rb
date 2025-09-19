class Game < ApplicationRecord
  has_many :likes, as: :likeable
  has_many :owneds, as: :ownable
  has_many :backlogs, as: :backloggable

  validates :title, :release_date, :rawg_id, presence: true
  validates :rawg_id, uniqueness: true

  def liked?(user)
    self.liked?.where(user: user).exist?
  end
end
