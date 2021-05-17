# frozen_string_literal: true

class Question < ApplicationRecord
  validates :title, length: { minimum: 2, maximum: 30 }
  validates :body, length: { minimum: 2, maximum: 100 }
  validates :answer_id, numericality: { greater_than: 0 }
  validates :payment, numericality: { greater_than_or_equal_to: 0 }
end
