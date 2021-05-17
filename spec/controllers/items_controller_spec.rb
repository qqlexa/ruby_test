# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ItemsController, type: :controller do
  include Devise::TestHelpers
  let(:current_user) do
    User.create!(
      email: 'currentuser@test.com',
      password: 'password',
      password_confirmation: 'password'
    )
  end

  context 'with GET #index' do
    it 'return a 200 response' do
      get :index
      expect(response).to have_http_status(:ok)
    end
  end

  context 'with POST #create' do
    it 'creates Item on a post request' do
      post :create,
           params: { post: { title: 'Title', body: 'Body',
                             price: 0 } }
      expect(response).to have_http_status(:found)
    end
  end

  context 'with POST #new' do
    it 'creates Item on a post request' do
      post :new,
           params: { post: { title: 'Title', body: 'Body',
                             price: 0 } }
      expect(response).to have_http_status(:found)
    end
  end

  describe 'with DELETE /destroy' do
    it 'destroy the request post' do
      item = Item.create(title: 'Title', body: 'Body', price: 0)
      expect do
        delete :destroy, params: { id: item.id }
      end.to change(Item, :count).by(0)
    end
  end
end
