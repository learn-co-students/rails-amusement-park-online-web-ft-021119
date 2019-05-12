Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'sessions#index'
  resources :users
  resources :attractions, only: [:index, :show, :new, :create, :edit, :update]
  resources :rides, only: [:new, :create]


  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'

  get '/logout', to: 'sessions#destroy'

end
