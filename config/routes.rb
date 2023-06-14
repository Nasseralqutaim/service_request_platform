Rails.application.routes.draw do
  resources :users 
  resources :sessions, only: [:new, :create, :destroy]
  resources :requests 
  resources :departments 
  get 'test', to: 'test#index'

  # ...
end

