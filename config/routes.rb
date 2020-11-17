Rails.application.routes.draw do

  root to: 'users#index'
  get '/signup', to: 'users#new'
  
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  resources :groups
  resources :categories
  resources :tasks
  resources :sessions, only: [:new, :create, :show]
  resources :users
  

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
