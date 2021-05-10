Rails.application.routes.draw do
  root 'static_pages#home'

  get '/team', to: 'static_pages#team'

  get '/contact', to: 'static_pages#contact'
  
  get '/welcome/:id', to: 'static_pages#welcome_user'

  post '/', to: 'static_pages#welcome_id'
  
  get '/gossip/:gossip_id', to: 'static_pages#gossip_id'
end