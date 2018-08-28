Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"
  resources :users, only: [:show, :index, :destroy]
  resources :groups
  get 'group_bills/:id', to: 'groups#bills', as: 'group_bills'
  get 'users/:id/ban', to: 'users#ban', as: 'ban'
end
