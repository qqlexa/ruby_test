# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'

  resources :articles do
    collection do
      get :search
    end
  end
  get '/market', to: 'items#index'
  resources :items do
    collection do
      get :search
      get :buy
    end
  end

  resources :questions do
    collection do
      get :search
    end
  end
end
