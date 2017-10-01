class Expense < ApplicationRecord
  belongs_to :type
  belongs_to :category

  validates :concept, :date, :amount, presence: true
  validates :amount, numericality: {greater_than_or_equal_to: 0}
end
