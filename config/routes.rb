Rails.application.routes.draw do
  root 'static_pages#index'

  get '/team', to: 'static_pages#team'

  get '/contact', to: 'static_pages#contact'
  
  resources :gossips, except: [:destroy]

  resources :users

end

# get '/welcome/:id', to: 'static_pages#welcome_user'

# post '/', to: 'static_pages#welcome_id', as: 'welcome'

# get '/gossip/:gossip_id', to: 'static_pages#gossip_id', as: 'gossip'

# get '/user/:user_id', to: 'static_pages#user_id', as: 'user'