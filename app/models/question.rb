# frozen_string_literal: true

class Question < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true
  validates :answer, presence: true
  validates :payment, numericality: { greater_than_or_equal_to: 0 }
end
