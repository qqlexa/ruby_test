# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'

  get '/me', to: 'inventories#index'
  resources :inventories do
    member do
      get :show
    end
  end

  get '/market', to: 'items#index'
  resources :items do
    member do
      get :buy
    end

    collection do
      get :search
    end
  end

  resources :questions do
    member do
      post :solve
    end
    collection do
      get :search
    end
  end
end
