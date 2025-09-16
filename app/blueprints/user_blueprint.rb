# frozen_string_literal: true

class UserBlueprint < Blueprinter::Base
  identifier :id

  field :username

  field :liked_ids do |user|
    ids = []
    user.likes.each do |like|
      ids << like.game.rawg_id
    end
    ids
  end
end
