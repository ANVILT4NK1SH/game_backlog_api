require "rest-client"

class RawgController < ApplicationController
  before_action :authenicate_request

  def initialize
    @key = "key=#{Rails.application.credentials.rawg_key}"

    @rawg_url = "https://api.rawg.io/api"
  end

  def get_all_games
    response = RestClient.get("#{@rawg_url}/games?#{@key}")

    render json: response, status: :ok
  end

  def filter_games
    # GET https://api.rawg.io/api/games?key=YOUR_API_KEY&dates=2019-09-01,2019-09-30&platforms=18,1,7&search=red-dead-redemtion
    response = RestClient.get("#{@rawg_url}/games?#{@key}#{params[:filterString]}")
    modified_response = JSON.parse(response)
    modified_response["next"] = "true" unless modified_response["next"] == nil

    modified_response["previous"] = "true" unless modified_response["previous"] == nil

    render json: modified_response, status: :ok
  end
end
