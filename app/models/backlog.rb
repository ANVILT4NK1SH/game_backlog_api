class Backlog < ApplicationRecord
  belongs_to :user
  belongs_to :backloggable, polymorphic: true
end
