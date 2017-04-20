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

  # Retrive Data for Graphics

  # return an array [Day, day-month-year]
  def self.month(scope)
    (scope.min.to_date..scope.max.to_date).select { |d| d.day == 1 }
  end

  # return a hash {[date, type] => sum_type}
  def self.dateType(trunc, range)
    Hash[(between(range).group(["date_trunc('#{trunc}', date)", "type"]).sum(:amount)).map { |key, value| [[key[0].to_date, types.key(key[1])], value] }]
  end
  
  # return a hash {[date, type] => total_type}
  def self.dateHash(group, date)
    # https://apidock.com/rails/Enumerable/each_with_object
    types.keys.each_with_object({ date: date }) do |type, hash|
      hash[type] = group.fetch([date, type.to_s], BigDecimal.new('0'))
    end
  end
  # Last 6 months graphic
  def self.type(range)
    month(range).map { |date| dateHash(dateType('month', range), date) }
  end
  # By day graphic
  def self.type_day(range)
    (range.min.to_date..range.max.to_date).map { |date| dateHash(dateType('day', range), date) }
  end
  # Category graphic
  def self.category(range)
    between(range).group(:category_id).sum(:amount)
  end
  # Accumulated graphic
  def self.accumulated(range)
    amount = 0
    (range.min.to_date..range.max.to_date).map do |date|
      amount += (Hash[(between(range).group("date_trunc('day', date)").sum(:amount)).map { |key, value| [key.to_date, value] }]).fetch(date, BigDecimal.new('0'))
      { date: date, amount: amount }
    end
  end
end