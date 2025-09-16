Rails.application.routes.draw do
  get "sessions/create"
  post "/login", to: "sessions#create"
  resources :users, only: [ :create ]
  resources :games do
    post "like"
    delete "unlike"
  end

  get "/rawg/getAllGames", to: "rawg#get_all_games"
  post "/rawg/filterGames", to: "rawg#filter_games"

  scope "/web" do
    get "bootstrap", to: "web#bootstrap"
  end
end
