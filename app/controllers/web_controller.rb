class WebController < ApplicationController
  before_action :authenticate_request

  def bootstrap
    render json: UserBlueprint.render(@current_user), status: :ok
  end
end
