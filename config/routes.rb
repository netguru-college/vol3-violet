Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"
  resources :users, only: [:show, :index, :destroy]
  resources :groups
  put 'users/:id', to: 'users#ban'
end
