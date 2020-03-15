Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :restaurants, only: [:index]

  root to: "restaurants#index"
end
