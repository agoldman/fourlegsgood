Fourlegsgood::Application.routes.draw do

  devise_for :users, :controllers => {
    :omniauth_callbacks => 'omniauth_callbacks'
  }

  root to: "statics#index"
  resources :statics
  resources :users do
    member do 
      post 'verify' => 'users#verify'
    end
  	resources :received_messages, only: [:index]
  	resources :sent_messages, only: [:index]
    resources :messages, only: [:index]
    resources :pets, only: [:index]
    resources :my_dogs_reviews, only: [:index]
    resources :my_sitting_reviews, only: [:index]
    resources :other_dogs_reviews, only: [:index]
    resources :other_sitters_reviews, only: [:index]
    resources :sat_for_dogs, only: [:index]
    resources :sitters, only: [:index]
  end
  resources :sitting_requests, only: [:index]
  resources :pets
  resources :current_requests

end
