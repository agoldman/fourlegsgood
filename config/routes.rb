Fourlegsgood::Application.routes.draw do

  root to: "statics#index"
  resources :statics
  resources :users do
  	resources :received_messages
  	resources :sent_messages
  end
  resources :sessions
  resources :sitting_requests
  resources :reviews
  resources :sittings
end
