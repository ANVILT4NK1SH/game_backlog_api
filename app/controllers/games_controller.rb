class GamesController < ApplicationController
  before_action :authenticate_request

  def create
   game = Game.find_or_create_by(game_params)
    if game.errors
      render json: game.errors, status: :unprocessable_entity
    end
  end

  def like
    game = Game.find_or_create_by(game_params)
    like = game.likes.new(user_id: @current_user.id)

    if like.save
      render json: nil, status: :ok
    else
      render json: like.errors, status: :unprocessable_entity
    end
  end

  def unlike
    game = Game.find_by(un_params)

    unless game
      render json: { error: "Game not found" }, status: :not_found
      return
    end
    # like = game.likes.find_by(user_id: @current_user.id)

    like = @current_user.likes.find_by(likeable_id: game.id)

    if like.destroy
      render json: nil, status: :ok
    else
      render json: like.errors, status: :unprocessable_entity
    end
  end

  def own
    game = Game.find_or_create_by(game_params)
    own = game.owneds.new(user_id: @current_user.id)

    if own.save
      render json: nil, status: :ok
    else
      render json: own.errors, status: :unprocessable_entity
    end
  end

  def unown
    game = Game.find_by(un_params)

    unless game
      render json: { error: "Game not found" }, status: :not_found
      return
    end
    own = game.owneds.find_by(user_id: @current_user.id)

    if own.destroy
      render json: nil, status: :ok
    else
      render json: own.errors, status: :unprocessable_entity
    end
  end

  def backlog
    game = Game.find_or_create_by(game_params)
    backlog = game.backlogs.new(user_id: @current_user.id)

    if backlog.save
      render json: nil, status: :ok
    else
      render json: backlog.errors, status: :unprocessable_entity
    end
  end

  def unbacklog
     game = Game.find_by(un_params)

    unless game
      render json: { error: "Game not found" }, status: :not_found
      return
    end
    backlog = game.backlogs.find_by(user_id: @current_user.id)

    if backlog.destroy
      render json: nil, status: :ok
    else
      render json: backlog.errors, status: :unprocessable_entity
    end
  end

  def game_params
    params.permit(:title, :release_date, :img_url, :rawg_id)
  end

  def un_params
    params.permit(:rawg_id)
  end
end
