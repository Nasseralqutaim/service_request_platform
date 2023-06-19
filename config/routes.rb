Rails.application.routes.draw do
  resources :users, defaults: { format: :json }
  resources :sessions, only: [:new, :create, :destroy]
  resources :requests 
  resources :departments 
end
