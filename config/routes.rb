# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'

  resources :inventories do
    member do
      post :show
      get :buy
    end
  end

  resources :items do
    get :buy, on: :member
    get :search, on: :collection
  end

  resources :questions do
    post :solve, on: :member
    get :search, on: :collection
  end
end
