Fourlegsgood::Application.routes.draw do

  root to: "statics#index"
  resources :statics
  resources :users do
  	resources :received_messages, only: [:index]
  	resources :sent_messages, only: [:index]
    resources :messages, only: [:index]
    resources :pets, only: [:index]
    resources :my_dogs_reviews, only: [:index]
  end
  resources :sessions
  resources :sitting_requests
  resources :reviews
  resources :sittings
end
