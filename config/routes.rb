# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root to: 'articles#index'

  resources :articles do
    collection do
      get :search
    end
  end
  # get '/articles', to: 'articles#index'
  # get "/articles/:id", to: "articles#show"
end
