Rails.application.routes.draw do
  devise_for :players

  root to: "offers#index"
end
