Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :trends, only: [:show, :create, :destroy]

  # Defines the root path route ("/")
  root "trends#index"

end
