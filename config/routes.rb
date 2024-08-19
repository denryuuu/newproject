Rails.application.routes.draw do
  delete 'logout', to: 'user_sessions#destroy', as: :logout
  
  root "static_pages#top"

  get "up" => "rails/health#show", as: :rails_health_check

  resources :users, only: %i[new create]
  resource :profile, only: %i[show edit update]
  resources :posts, only: %i[index new create show edit update destroy] do
    resources :comments, only: %i[create destroy], shallow: true
  end

  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'

end
