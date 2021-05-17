class Answer < ApplicationRecord
  has_many :questions, dependent: :destroy

  validates :answer, length: { minimum: 1, maximum: 30 }
end
