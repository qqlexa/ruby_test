# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Inventory, type: :model do
  context 'with validation tests' do
    it 'ensures user_id presence' do
      inventory = described_class.new(user_id: 1).save
      expect(inventory).to eq(false)
    end

    it 'ensures item_id presence' do
      inventory = described_class.new(item_id: 1).save
      expect(inventory).to eq(false)
    end

    it 'saves successfully' do
      _user = User.new(email: 'example@mail.com', password: 'password').save
      _item = Item.new(title: 'Title', body: 'Body', price: 0).save
      inventory = described_class.new(user_id: 1, item_id: 1).save
      expect(inventory).to eq(true)
    end
  end
end
