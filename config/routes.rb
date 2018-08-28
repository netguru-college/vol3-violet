Rails.application.routes.draw do
  devise_for :users, :controllers => {
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  root to: "home#index"
  resources :users, only: [:show, :index, :destroy]
  resources :groups
  get 'users/:id/ban', to: 'users#ban', as: 'ban'
end
