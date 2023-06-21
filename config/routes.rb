Rails.application.routes.draw do
  resources :users, defaults: { format: :json } do
    resources :requests, only: [:index, :create, :update, :show, :destroy]
  end

  resources :sessions, only: [:new, :create, :destroy]
  resources :requests, defaults: { format: :json }
  resources :departments 
end
