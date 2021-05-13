# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Question, type: :model do
  context 'with validation tests' do
    it 'ensures title presence' do
      question = described_class.new(body: 'Body', answer: 'Answer', payment: 0).save
      expect(question).to eq(false)
    end

    it 'ensures body presence' do
      question = described_class.new(title: 'Title', answer: 'Answer', payment: 0).save
      expect(question).to eq(false)
    end

    it 'ensures answer presence' do
      question = described_class.new(title: 'Title', body: 'Body', payment: 0).save
      expect(question).to eq(false)
    end

    it 'ensures payment presence' do
      question = described_class.new(title: 'Title', body: 'Body', answer: 'Answer').save
      expect(question).to eq(false)
    end

    it 'saves successfully' do
      question = described_class.new(title: 'Title', body: 'Body', answer: 'Answer', payment: 0).save
      expect(question).to eq(true)
    end
  end
end
