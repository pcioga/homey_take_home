Rails.application.routes.draw do
  constraints(lambda { |req| req.session[:user_id].present? }) do
    root to: "projects#index", as: :authenticated_root
  end

  root to: "home#index"
  
  get "/signup", to: "users#new"
  post "/signup", to: "users#create"

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  resources :users, only: [:new, :create]
end
