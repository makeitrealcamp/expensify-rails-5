class Expense < ApplicationRecord
  # ActiveRecord::SubclassNotFound: Invalid single-table inheritance type: purchase is not a subclass of Expense
  self.inheritance_column = nil

  belongs_to :category
  enum type: [:purchase, :withdrawal, :transfer, :payment]

end