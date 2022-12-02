Rails.application.routes.draw do
  root "home#index"

  scope "/blog" do
    get "/login", to: "sessions#new"
    get "/logout", to: "sessions#destroy"
    get "/register", to: "users#new"
    get "/my", to: "users#index"
    get "/my/articles", to: "users#articles"

    resources :articles, only: [:index, :show, :new, :create, :edit]
    resources :users, only: [:new, :create, :index, :show]
    resources :sessions, only: [:new, :create, :destroy]
  end

  scope "/game" do
    get "/buddy", to: "buddy#show"
    get "/buddy/all", to: "buddy#index"
    post "/buddy", to: "buddy#create"
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
