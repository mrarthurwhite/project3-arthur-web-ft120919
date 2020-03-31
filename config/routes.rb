Rails.application.routes.draw do
  resources :events, only: [:index, :new, :create, :edit, :update, :destroy]
  resources :users
  resources :registrations, only: [:edit,  :update, :create, :show]
  resources :events, only: [:show] do
    resources :registrations, only: [ :index, :new]
  end
  get "/auth/google_oauth2/callback", to: "users#create_with_google_oauth"

  # User Authentication and Authorization Routes
  get "/signup", to: "users#new"
  get "/login", to: "users#login"
  post '/login', to: "users#signin", as: "signin"
  post '/logout', to: "users#logout", as: "logout"
  # This is the root route
  root 'welcomes#index'
end
