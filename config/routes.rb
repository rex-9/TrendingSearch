Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :trends, only: [:show, :create, :destroy]

  get "/dashboard", to: "admin#dashboard"
  get "/users/:id/trends", to: "admin#user_trends", as: "user_trends"
  get "/trends/:id/users", to: "admin#trend_users", as: "trend_users"

  # Defines the root path route ("/")
  root to: "trends#search"
end
