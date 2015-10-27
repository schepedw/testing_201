Rails.application.routes.draw do
  resources :account_types
  resources :accounts
  resources :addresses
  resources :banks
  resources :users
  root to: 'status#index'
end
