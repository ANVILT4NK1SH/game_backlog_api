require "rest-client"

class RawgController < ApplicationController
  before_action :authenticate_request

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

  def get_all_genres
    genres = fetch_all_genres
    render json: genres, status: :ok
  rescue StandardError => e
    Rails.logger.error("Error in get_all_genres: #{e.message}\n#{e.backtrace.join("\n")}")
    render json: { error: "Failed to fetch genres: #{e.message}" }, status: :internal_server_error
  end

  def get_all_platforms
    platforms = fetch_all_platforms
    render json: platforms, status: :ok
  rescue StandardError => e
    render json: { error: "Failed to fetch platforms: #{e.message}" }, status: :internal_server_error
  end

  private

  def fetch_all_genres
    url = "#{@rawg_url}/genres?#{@key}"
    genres = []

    loop do
      Rails.logger.info("Fetching genres from: #{url}")
      response = RestClient.get(url)
      Rails.logger.info("RAWG API response: #{response.body}")
      data = JSON.parse(response.body)
      genres.concat(data["results"].map do |genre|
        { id: genre["id"], name: genre["name"], slug: genre["slug"] }
      end)
      url = data["next"]
      Rails.logger.info("Next URL: #{url}")
      break unless url
    end
    genres
  rescue RestClient::Exception => e
    Rails.logger.error("RestClient error: #{e.message}\nResponse: #{e.response&.body}")
    raise
  rescue JSON::ParserError => e
    Rails.logger.error("JSON parsing error: #{e.message}\nResponse: #{response&.body}")
    raise
  end

  def fetch_all_platforms
    url = "#{rawg_url}/platforms?#{key}"
    platforms = []

    loop do
      response = RestClient.get(url)
      data = JSON.parse(response.body)
      platforms.concat(data["results"].map {
        |platform| { id: platform["id"], name: platform["name"], slug: platform["slug"] }
      })
      url = data["next"]
      break unless url
    end
    platforms
  end
end
