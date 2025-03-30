Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  
  delete 'logout', to: 'user_sessions#destroy', as: :logout
  
  root "static_pages#top"

  get "up" => "rails/health#show", as: :rails_health_check

  get '/terms', to: 'pages#terms', as: 'terms'
  get '/privacy_policy', to: 'pages#privacy_policy', as: 'privacy_policy'
  get '/contact', to: 'contacts#new', as: 'new_contact'
  post '/contact', to: 'contacts#create', as: 'create_contact'

  resources :users, only: %i[new create destroy]
  resource :profile, only: %i[show edit update]
  resources :posts, only: %i[index new create show edit update destroy] do
    collection do
      get 'user_posts', to: 'posts#user_posts'
    end
    resources :comments, only: %i[create destroy], shallow: true
    collection do
      get :likes
    end
  end

  resources :likes, only: %i[create destroy]
  resources :password_resets, only: %i[new create edit update]
  resources :contacts, only: [:new, :create]
  
  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'

end
