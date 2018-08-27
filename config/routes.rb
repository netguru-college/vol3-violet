Rails.application.routes.draw do
  devise_for :users
  root to: "users#show"
  resources :users, only: [:show, :index, :destroy]
  resources :groups
  put 'users/:id', to: 'users#ban'
end
