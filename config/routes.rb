Rails.application.routes.draw do
  get 'sessions/new'
  root 'tasks#index'
  resources :tasks 
  resources :sessions, only: [:new, :create, :destroy]
  resources :users  
  namespace :admin do
    resources :users
  end
  get "search_tag" => "tasks#search_tag"
end
