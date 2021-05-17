class Answer < ApplicationRecord
  validates :answer, presence: true, length: { minimum: 1, maximum: 30 }
end
