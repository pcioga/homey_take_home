# frozen_string_literal: true

Rails.application.routes.draw do
  constraints(->(req) { req.session[:user_id].present? }) do
    root to: 'projects#index', as: :authenticated_root
  end

  root to: 'home#index'

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :users, only: %i[new create]

  resources :projects, only: %i[index show new create] do
    resources :comments, only: %i[create edit update destroy]
    resources :status_changes, only: %i[create]
  end
end
