Rails.application.routes.draw do
  resources :attractions
  resources :users, except: [:destroy]
  resources :rides
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'users#new'


  get '/new', to: 'users#new'
  get '/signup', to: 'users#new'
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'

  post '/rides', to: 'rides#create'


end
