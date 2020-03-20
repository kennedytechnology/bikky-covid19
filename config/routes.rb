Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :restaurants, only: [:index]
  resources :guides, only: [:index]
  resources :partners, only: [:show] 
  get "pages/about"

  root to: "restaurants#index"
end
