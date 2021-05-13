Rails.application.routes.draw do
  get 'cities/show'
  root 'static_pages#index'

  get '/team', to: 'static_pages#team'

  get '/contact', to: 'static_pages#contact'

  get '/welcome/:id', to: 'dynamic_pages#show'

  get '/profile', to: 'static_pages#profile'
  
  resources :gossips do
    resources :comments
  end

  resources :users

  resources :cities

  resources :dynamic_pages

  resources :sessions, only: [:new, :create, :destroy]

end

# get '/welcome/:id', to: 'static_pages#welcome_user'

# post '/', to: 'static_pages#welcome_id', as: 'welcome'

# get '/gossip/:gossip_id', to: 'static_pages#gossip_id', as: 'gossip'

# get '/user/:user_id', to: 'static_pages#user_id', as: 'user'