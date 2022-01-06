Rails.application.routes.draw do
  get 'sessions/new'
  root 'tasks#index'
  resources :tasks 
  resources :users, only: [:new, :create, :show, :index, :destroy]
  resources :sessions, only: [:new, :create, :destroy]
end
