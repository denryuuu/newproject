Rails.application.routes.draw do
  root "static_pages#top"

  get "up" => "rails/health#show", as: :rails_health_check

  resources :posts, only: [:new, :create, :index]
  resources :users, only: %i[new create]

  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'
end
