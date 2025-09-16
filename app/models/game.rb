class Game < ApplicationRecor
  has_many :likes, as: :likeable
  has_many :owneds, as: :ownable

  validates :name, :release_date, :rawg_id, presence: true
  validates :rawg_id, uniqueness: true

  def liked?(user)
    self.liked?.where(user: user).exist?
  end
end
