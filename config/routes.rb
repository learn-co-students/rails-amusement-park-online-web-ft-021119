Rails.application.routes.draw do
  root to: 'application#home'

  resources :attractions
  resources :users

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  post '/rides', to: 'rides#create'
end
