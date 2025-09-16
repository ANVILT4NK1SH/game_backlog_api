class GamesController < ApplicationController
  before_action :authenticate

  def create(params)
   Game.find_or_create_by(params)
    if game.errors
      render json: game.errors, status: :unprocessable_entity
    end
  end

  def like
    like = game.likes.new(user_id: @current_user.id)

    if like.save
      render status: :ok
    else
      render json: like.error, status: :unprocessable_entity
    end
  end

  def unlike
    game = Game.find(params[:game_id])
    like = game.likes.find_by(user_id: @current_user.id)

    if like.destroy
      head status: :ok
    else
      render status: :unprocessable_entity
    end
  end

  def own
    game = create_game(params)

    if game.errors
      render json: game.errors, status: :unprocessable_entity
      return
    end
    own = game.owneds.new(user_id: @current_user.id)

    if own.save
      render status: :ok
    else
      render json: own.error, status: :unprocessable_entity
    end
  end

  def unown
    game = Game.find(params[:game_id])
    own = game.owneds.find_by(user_id: @current_user.id)

    if own.destroy
      head status: :ok
    else
      render status: :unprocessable_entity
    end
  end

  def params
    params.permit(:name, :release_date, :img_url, :rawg_id)
  end
end
