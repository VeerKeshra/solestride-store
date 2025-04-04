Rails.application.routes.draw do
  namespace :admin do
    get "products/index"
    get "products/new"
    get "products/create"
    get "products/edit"
    get "products/update"
    get "products/destroy"
  end

  namespace :admin do
    resources :products
  end

  resources :products do
    resources :variants, only: [ :new, :create, :edit, :update, :destroy ], module: :admin
  end


  # Static Pages
  root "static_pages#home"
  get "/about", to: "static_pages#about"
  get "/contact", to: "static_pages#contact"

  # Devise Authentication
  devise_for :users

  # Future Resources (e.g., products, categories, orders)
  # resources :products
  # resources :categories
  # resources :orders

  # Health Check (optional)
  get "up", to: "rails/health#show", as: :rails_health_check
end
