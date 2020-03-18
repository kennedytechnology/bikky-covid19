Rails.application.routes.draw do
  resources :restaurants, only: [:index]
  resources :guides, only: [:index]
  get "pages/about"

  root to: "restaurants#index"
end
