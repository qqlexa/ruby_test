require 'rails_helper'

RSpec.describe Answer, type: :model do
  context 'with validation tests' do
    it 'ensures answer presence' do
      answer = described_class.new.save
      expect(answer).to eq(false)
    end

    it 'ensures answer not short' do
      answer = described_class.new(answer: '').save
      expect(answer).to eq(false)
    end

    it 'ensures answer not long' do
      answer = described_class.new(answer: 'A' * 31).save
      expect(answer).to eq(false)
    end

    it 'saves successfully' do
      answer = described_class.new(answer: 'Answer').save
      expect(answer).to eq(true)
    end
  end
end
