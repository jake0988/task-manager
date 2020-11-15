Rails.application.routes.draw do
  resources :groups
  resources :categories
  resources :tasks
  resources :sessions, only: [:new, :create, :show]
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
