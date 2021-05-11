class Item < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true
  validates :price, numericality: { greater_than: 0 }
end
