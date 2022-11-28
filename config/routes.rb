Rails.application.routes.draw do
  root "home#index"

  get "/login", to: "sessions#new"
  get "/logout", to: "sessions#destroy"
  get "/register", to: "users#new"
  get "/my", to: "users#index"
  get "/my/articles", to: "users#articles"

  resources :articles, only: [:index, :show, :new, :create, :edit]
  resources :users, only: [:new, :create, :index, :show]
  resources :sessions, only: [:new, :create, :destroy]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
