# frozen_string_literal: true

require 'rails_helper'

RSpec.describe InventoriesController, type: :controller do
  include Devise::TestHelpers

  let(:current_user) do
    User.create!(
      email: 'currentuser@test.com',
      password: 'password',
      password_confirmation: 'password'
    )
  end

  context 'with GET #index' do
    it 'return a 302 response' do
      get :index
      expect(response).to have_http_status(:found)
    end
  end
end
