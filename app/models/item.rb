# frozen_string_literal: true

class Item < ApplicationRecord
  has_many :inventory, dependent: :destroy

  validates :title, presence: true, length: { minimum: 2, maximum: 30 }
  validates :body, presence: true, length: { minimum: 2, maximum: 100 }
  validates :price, numericality: { greater_than_or_equal_to: 0 }
end
