class Expense < ApplicationRecord
  # ActiveRecord::SubclassNotFound: Invalid single-table inheritance type: purchase is not a subclass of Expense
  self.inheritance_column = nil
  after_initialize :default_date

  belongs_to :category
  enum type: [:purchase, :withdrawal, :transfer, :payment]

  validates :type, presence: true
  validates :concept, presence: true
  validates :amount, presence: true, numericality: { greater_than: 0 }

  # http://api.rubyonrails.org/classes/ActiveRecord/Scoping/Named/ClassMethods.html#method-i-scope
  scope :between, lambda { |range| where(date: range) }
  
  def default_date
    self.date ||= Date.current
  end
end