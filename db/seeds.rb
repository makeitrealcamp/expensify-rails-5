# Expense.delete_all
# Category.delete_all
# create! raises exception, create returns the object (unsaved object if it does not pass validations)

Category.create(name: "Automobile")
Category.create(name: "Bank")
Category.create(name: "Clothing")
Category.create(name: "Education")
Category.create(name: "Events")
Category.create(name: "Food")
Category.create(name: "Healthcare")
Category.create(name: "Utilities")
Category.create(name: "Travel")

# end_date = Date.today
# start_date = end_date - 6.month
# categories = Category.all
# transaction_types = Expense.types.keys

# (start_date..end_date).each do |date|
#   5.times do
#     expense = Expense.new
#     expense.date = date
#     expense.concept = Faker::Commerce.product_name
#     expense.amount = Faker::Number.between(30_000, 1_500_000)
#     expense.type = transaction_types.sample
#     expense.category = categories.sample
#   end
# end

# A better way
6.downto(0).each do |i|
  start_day = i.months.ago.beginning_of_month.to_date
  end_day = start_day.end_of_month.to_date

  start_day.upto(end_day) do |date|
    Expense.create(type: Expense.types.keys.sample, concept: Faker::Commerce.product_name,
      date: date, amount: Faker::Number.between(20_000, 2_405_000), category: Category.all.sample)
  end
end