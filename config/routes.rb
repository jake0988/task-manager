Rails.application.routes.draw do


  root to: 'users#index'

  get '/signup', to: 'users#new', as: 'signup'
  post '/signup', to: 'users#create'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  


  delete '/logout', to: 'sessions#destroy', as: 'logout'

  resources :users
  resources :groups
  resources :categories
  
  resources :sessions, only: [:new, :create, :show]

  

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
