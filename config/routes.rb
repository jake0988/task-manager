Rails.application.routes.draw do

  # get '/groups/new', to: 'groups#new', as: 'new_group'
  # get '/groups/:id', to: 'groups#show', as: 'group'
  
  root to: 'users#index'

  get '/auth/github/callback' => 'sessions#create'

  get '/signup', to: 'users#new', as: 'users'
  post '/signup', to: 'users#create'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  delete '/logout', to: 'sessions#destroy', as: 'logout'
  
  # post '/users/:user_id/groups', to: 'groups#create', as: 'user_groups'

  get '/users/most_tasks', to: 'users#most_tasks', as: 'most_tasks'


  # get '/groups/:id/group_tasks', to: 'group_tasks#new', as: 'new_group_group_task'
  # post '/groups/:id/group_tasks', to: 'group_tasks#create', as: 'group_tasks'
  # patch '/group_tasks/:id/edit', to: 'group_tasks#update', as: 'group_group_task'
  # get '/groups/:id/new', to: 'group_tasks#new', as: 'new_group_task'
  # patch '/groups/:group_id/goal', to: 'goals#create', as: 'group_goal'
  # #group goals
  # get '/groups/:id/goal', to: 'goals#new', as: 'group_goals'
  # post '/goals', to: 'goals#create'
  # get '/groups/:id/goal/:id/edit', to: 'goals#edit', as: 'edit_group_goal'
  # patch 'groups/:id/goals/:id', to: 'goals#update'

  # #user goals
  # get '/users/:id/goal', to: 'goals#new', as: 'user_goals'
  # post '/users/:id/goal', to: 'goals#create'
  # get '/users/:user_id/goal/:id/edit', to: 'goals#edit', as: 'edit_user_goal'
  patch '/goals/:id', to: 'goals#update'
  post '/goals', to: 'goals#create'

  # post '/users/:id/tasks', to: 'tasks#create'
  # delete '/task/:id', to: 'tasks#destroy', as: 'task'
# patch '/users/:user_id/tasks/:id', to: 'tasks#update'
# get '/users/:user_id/tasks/:id/edit', to: 'tasks#edit', as: 'edit_user_tasks'

  # delete 'groups/:group_id/task/:id', to: 'group_tasks#destroy', as: 'group_task'

  #Comments
  get '/users/:user_id/tasks/:id/comment', to: 'comments#edit', as: 'comment_user_tasks'
  patch '/users/:user_id/tasks/:id/comment', to: 'comments#update', as: 'update_comment_user_tasks'
  
  
  get '/groups/:group_id/tasks/:id/comment', to: 'comments#edit', as: 'comment_group_task'
  patch '/groups/:group_id/tasks/:id/comment', to: 'comments#update', as: 'update_comment_group_task'

  
 
  
  

  
  get '/users/:user_id/groups/:id/edit', to: 'groups#edit', as: 'edit_user_group'
  get '/users/:user_id/tasks/:id/goal/:status', to: 'tasks#edit', as: 'goal_user_task'
  get 'groups/:group_id/tasks/:id/:complete', to: 'group_tasks#edit', as: 'complete_group_task'
  get 'users/:user_id/tasks/:id/:complete', to: 'tasks#edit', as: 'complete_user_task'
  

  resources :users, only: [:show, :edit] do
    # resources :tasks, only: [:new, :create, :edit, :update]
    resources :tasks, only: [:new, :create, :edit, :update, :destroy]
    resources :goals, only: [:new, :create, :show, :edit, :update]
  end

  resources :groups do
    resources :group_tasks, only: [:new, :create, :update, :destroy]
    resources :goals, only: [:new, :create, :edit, :update]
  end
  

  

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
