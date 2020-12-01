Rails.application.routes.draw do


  root to: 'users#index'

  get '/signup', to: 'users#new', as: 'users'
  post '/signup', to: 'users#create'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  


  delete '/logout', to: 'sessions#destroy', as: 'logout'
  resources :users, only: [:show] do
    resources :tasks, only: [:new, :create, :index]
    resources :groups, only: [:new, :create, :index, :show]
  end

  resources :groups
  resources :categories
  
  resources :sessions, only: [:new, :create, :show]

  

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
