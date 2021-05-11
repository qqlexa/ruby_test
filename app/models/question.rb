class Question < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true
  validates :answer, presence: true
  validates :payment, numericality: { greater_than: 0 }
end
