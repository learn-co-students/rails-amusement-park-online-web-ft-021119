Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'application#home'

  resources :users
  resources :attractions do
    resources :rides, only: :create
  end

  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  post '/signout', to: 'sessions#destroy'

  # post '/attractions/:id/go_on_ride', to: 'attractions#go_on_ride', as: 'go_on_ride'
end
