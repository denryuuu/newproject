Rails.application.routes.draw do

  get "up" => "rails/health#show", as: :rails_health_check

  root "static_pages#top"
  resources :posts, only: [:new, :create, :index, :show]
  resources :locations, only: [:index] 
end
