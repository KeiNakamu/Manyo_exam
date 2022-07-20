Rails.application.routes.draw do
  resources :labels
  namespace :admin do
    resources :users
  end
  root 'tasks#index'
  resources :sessions, only: [:new, :create, :destroy]
  resources :users
  resources :tasks
end
