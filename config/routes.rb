Fourlegsgood::Application.routes.draw do

  # devise_for :users, :controllers => {
  #   :omniauth_callbacks => 'omniauth_callbacks'
  # }

  root to: "statics#index"
  resources :statics
  resources :users do
    member do 
      post 'verify' => 'users#verify'
    end
    member do 
      post 'confirm' => 'users#confirm'
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

  ## Omni-auth / Facebook login
  match 'auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  match 'auth/failure', to: redirect('/'), via: [:get, :post]
  match 'signout', to: 'sessions#destroy', as: 'signout', via: [:get, :post]

  resources :sitting_requests, only: [:index]
  resources :sittings
  resources :messages, only: [:new]
  resources :pets
  resources :current_requests do
    collection do
      get 'active' => 'current_requests#active'
    end
  end

  post 'stripehook' => 'hooks#stripehook'

end
