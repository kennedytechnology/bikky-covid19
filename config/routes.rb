Rails.application.routes.draw do
  resources :restaurants, only: [:index]
  resources :guides, only: [:index]
  resources :partners, only: [:show] 
  get "pages/about"

  root to: "restaurants#index"
end
