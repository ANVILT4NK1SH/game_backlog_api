class Owned < ApplicationRecord
  belongs_to :user
  belongs_to :ownable, polymorphic: true
end
