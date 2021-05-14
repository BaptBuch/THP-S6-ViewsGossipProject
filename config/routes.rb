Rails.application.routes.draw do
  
  root 'static_pages#index'

  #get '/team', to: 'static_pages#team'

  #get '/contact', to: 'static_pages#contact'

  #get '/welcome/:id', to: 'dynamic_pages#show'

  #get '/profile', to: 'static_pages#profile'
  
  resources :gossips do
    resources :comments
  end

  resources :gossips do
    resources :likes
  end

  resources :users

  resources :cities

  resources :static_pages

  resources :sessions, only: [:new, :create, :destroy]

  resources :team, only: [:index]

  resources :contact, only: [:index]

  resources :profile, only: [:index, :edit, :update]

end