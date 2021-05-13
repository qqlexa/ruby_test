# frozen_string_literal: true

require 'rails_helper'

RSpec.describe InventoriesController, type: :controller do
  context 'with GET #index' do
    it 'return a 200 response' do
      get :index
      expect(response).to have_http_status(:ok)
    end
  end

  context 'with GET #show' do
    it 'return a 200 response' do
      get :show
      expect(response).to have_http_status(:ok)
    end
  end
end
