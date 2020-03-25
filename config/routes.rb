Rails.application.routes.draw do
  resources :events, only: [:index, :new, :create, :edit, :update, :delete]
  resources :users
  resources :registrations, only: [:edit,  :update, :create, :show]

  # RSVP routes
  get "/events/:id/registration/new", to: "registrations#new", as: "new_registration"
  #post '/register', to: "registrations#eventSignUp", as: "eventSignUp"

  # User Authentication and Authorization Routes
  get "/signup", to: "users#new"
  get "/login", to: "users#login"
  post '/login', to: "users#signin", as: "signin"
  post '/logout', to: "users#logout", as: "logout"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.htm
  root 'welcomes#index'
end
