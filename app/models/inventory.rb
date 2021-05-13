# frozen_string_literal: true

class Inventory < ApplicationRecord
  validates :user_id, numericality: { greater_than: 0 }
  validates :item_id, numericality: { greater_than: 0 }
end
