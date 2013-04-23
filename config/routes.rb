Fourlegsgood::Application.routes.draw do

  root to: "statics#index"
  resources :statics
  resources :users
  resources :sessions
  resources :sitting_requests
end
