Rails.application.routes.draw do
  resources :users
  root 'tasks#index'
  resources :tasks
end
