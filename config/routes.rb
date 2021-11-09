Rails.application.routes.draw do
  resources :profiles
  resources :users
  devise_for :users
  root to: 'events#index'
  resources :events
  
end
