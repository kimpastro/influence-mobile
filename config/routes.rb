Rails.application.routes.draw do
  devise_for :players

  root to: "offers#index"

  resources :offers, only: [:index]
  resources :claimed_offers, only: [:index, :show, :create]
end
