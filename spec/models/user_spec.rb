# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  context 'with validation tests' do
    it 'ensures title presence' do
      user = described_class.new(password: 'password').save
      expect(user).to eq(false)
    end

    it 'ensures password presence' do
      user = described_class.new(email: 'example@mail.com').save
      expect(user).to eq(false)
    end

    it 'saves successfully' do
      user = described_class.new(email: 'example@mail.com', password: 'password').save
      expect(user).to eq(true)
    end
  end
end
