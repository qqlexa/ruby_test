# frozen_string_literal: true

class Item < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }
end
