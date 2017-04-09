require 'test_helper'

class ExpenseTest < ActiveSupport::TestCase
  test "should save a new expense" do
    expense = Expense.new(type: :withdrawal, concept: "A bank withdrawal", date: 1.day.ago, amount: 1000, category: categories(:travel))
    assert expense.save
  end

  test "should not save a expense without a concept" do
    expense = expenses(:roadTrip)
    expense.concept = nil

    assert_not expense.save
  end

  test "should not initialize a expense with an invalid type" do
    assert_raises ArgumentError do
      expense = Expense.new(type: :invalid, concept: "Blablabla", date: 1.day.ago, amount: 10, category: categories(:education))
    end
  end

  test "should not save a expense without an amount" do
    expense = expenses(:school)
    expense.amount = nil

    assert_not expense.save
  end

  test "should not save a expense without a category" do
    expense = expenses(:school)
    expense.category = nil

    assert_not expense.save
  end
end
