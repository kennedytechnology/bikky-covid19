Rails.application.routes.draw do
  resources :restaurants, only: [:index]
  get "pages/guides"

  root to: "restaurants#index"
end
