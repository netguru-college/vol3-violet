Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"
  resources :users, only: [:show, :index, :destroy]
  resources :groups do
    resources :bills
  end
  get 'users/:id/ban', to: 'users#ban', as: 'ban'
end
