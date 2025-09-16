class WebController < ApplicationController
  before_action :authenicate_request

  def bootstrap
    render json: UserBlueprint.render(@current_user), status: :ok
  end
end
