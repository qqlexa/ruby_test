# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Item, type: :model do
  context 'with validation tests' do
    it 'ensures title presence' do
      item = described_class.new(body: 'Body', price: 0).save
      expect(item).to eq(false)
    end

    it 'ensures title not short' do
      item = described_class.new(title: 'T', body: 'Body', price: 0).save
      expect(item).to eq(false)
    end

    it 'ensures title not long' do
      item = described_class.new(title: 'T' * 31, body: 'Body', price: 0).save
      expect(item).to eq(false)
    end

    it 'ensures body presence' do
      item = described_class.new(title: 'Title', price: 0).save
      expect(item).to eq(false)
    end

    it 'ensures body not short' do
      item = described_class.new(title: 'Title', body: 'B', price: 0).save
      expect(item).to eq(false)
    end

    it 'ensures body not long' do
      item = described_class.new(title: 'Title', body: 'B' * 301, price: 0).save
      expect(item).to eq(false)
    end

    it 'saves successfully with default price' do
      item = described_class.new(title: 'Title', body: 'Body').save
      expect(item).to eq(true)
    end

    it 'saves successfully' do
      item = described_class.new(title: 'Title', body: 'Body', price: 0).save
      expect(item).to eq(true)
    end
  end
end
