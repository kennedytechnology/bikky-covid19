Rails.application.routes.draw do
  resources :restaurants, only: [:index]
  resources :guides, only: [:index]

  root to: "restaurants#index"
end
