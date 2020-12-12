Rails.application.routes.draw do


  root to: 'users#index'

  get '/auth/github/callback' => 'sessions#create'

  get '/signup', to: 'users#new', as: 'users'
  post '/signup', to: 'users#create'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  delete '/logout', to: 'sessions#destroy', as: 'logout'
  
  post '/tasks', to: 'tasks#create'

  get '/users/:id/tasks/:id/edit', to: 'tasks#edit', as: 'edit_user_tasks'
  resources :users, only: [:show] do
    resources :tasks, only: [:new, :create, :update]
    resources :groups, only: [:new, :create, :show]
  end

  patch '/users/:id/edit', to: 'users#update'
  resources :users
  resources :groups
  resources :categories
  
  resources :sessions, only: [:new, :create, :show]

  

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
