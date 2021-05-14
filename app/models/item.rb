# frozen_string_literal: true

class Item < ApplicationRecord
  has_many :inventory, dependent: :destroy

  validates :title, presence: true
  validates :body, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }
end
