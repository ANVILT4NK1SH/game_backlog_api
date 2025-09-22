Rails.application.routes.draw do
  get "sessions/create"
  post "/login", to: "sessions#create"
  resources :users, only: [ :create ]

  post "/games/like", to: "games#like"
  post "/games/unlike", to: "games#unlike"
  post "/games/own", to: "games#own"
  post "/games/unown", to: "games#unown"
  post "/games/backlog", to: "games#backlog"
  post "/games/unbacklog", to: "games#unbacklog"
  get "games/userlikes", to: "games#get_user_likes"
  get "games/userowned", to: "games#get_user_owned"
  get "games/userbacklog", to: "games#get_user_backlog"

  get "/rawg/getAllGames", to: "rawg#get_all_games"
  post "/rawg/filterGames", to: "rawg#filter_games"
  post "/rawg/getGameById", to: "rawg#get_game_by_id"
  get "/rawg/genres", to: "rawg#get_all_genres"
  get "/rawg/platforms", to: "rawg#get_all_platforms"

  scope "/web" do
    get "bootstrap", to: "web#bootstrap"
  end
end
