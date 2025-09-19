# frozen_string_literal: true

class UserBlueprint < Blueprinter::Base
  identifier :id

  field :username

  field :liked_ids do |user|
    ids = []
    user.likes.each do |like|
      ids << like.likeable.rawg_id
    end
    ids
  end

  field :owned_ids do |user|
    ids = []
    user.owneds.each do |own|
      ids << own.ownable.rawg_id
    end
    ids
  end

  field :backlog_ids do |user|
    ids = []
    user.backlogs.each do |backlog|
      ids << backlog.backloggable.rawg_id
    end
    ids
  end
end
