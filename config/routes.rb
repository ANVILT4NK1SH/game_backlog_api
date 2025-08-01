Rails.application.routes.draw do
  get "sessions/create"
  post "/login", to: "sessions#create"
  resources :users, only: [ :create ]
end
