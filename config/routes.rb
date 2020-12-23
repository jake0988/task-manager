Rails.application.routes.draw do

  get '/groups/:id/new', to: 'group_tasks#new', as: 'new_group_task'
  root to: 'users#index'

  get '/auth/github/callback' => 'sessions#create'

  get '/signup', to: 'users#new', as: 'users'
  post '/signup', to: 'users#create'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  delete '/logout', to: 'sessions#destroy', as: 'logout'
  
  post '/tasks', to: 'tasks#create'
  
  patch '/group_tasks/:id/edit', to: 'group_tasks#update', as: 'group_group_task'

  patch '/users/:id/edit', to: 'users#update'

  get '/groups/:id/goal', to: 'goals#new'

  post '/goals', to: 'goals#create'

  get '/groups/:id/goal/edit', to: 'goals#edit'
  
  patch '/goals', to: 'goals#update'

  # delete '/goals', to: 'goals#destroy'

  #Comments
  get '/users/:user_id/tasks/:id/comment', to: 'tasks#edit', as: 'comment_user_tasks'
  get 'users/:user_id/tasks/:id/:complete', to: 'tasks#edit', as: 'complete_user_task'
  get '/groups/:group_id/tasks/:id/comment', to: 'group_tasks#edit', as: 'comment_group_task'
  get 'groups/:group_id/tasks/:id/:complete', to: 'group_tasks#edit', as: 'complete_group_task'

  
  get '/users/:user_id/tasks/:id/edit', to: 'tasks#edit', as: 'edit_user_tasks'
  
  

  patch '/tasks', to: 'tasks#update'

  get '/users/:user_id/groups/:id/edit', to: 'groups#edit', as: 'edit_user_group'

  resources :users, only: [:show] do
    resources :tasks, only: [:new, :create, :update]
  end

  resources :group_tasks
  resources :users
  resources :groups 
  resources :categories
  
  resources :sessions, only: [:new, :create, :show]

  

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
