class Expense < ApplicationRecord
  belongs_to :type
  belongs_to :category

  validates :concept, :date, :amount, presence: true
  validates :amount, numericality: {greater_than_or_equal_to: 0}

  scope :find_category, ->(category) {Expense.where("category_id = ?", category)}
  scope :find_type, ->(type) {Expense.where("type_id = ?", type)}
  scope :find_month, ->(month) {Expense.where('extract(month from date) = ?', month)}
  scope :find_year, ->(year) {Expense.where('extract(year from date) = ?', year)}
end
