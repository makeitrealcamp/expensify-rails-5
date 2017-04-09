require 'test_helper'

class ExpensesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get expenses_path
    assert_response :success
  end

  test "should get new" do
    get new_expense_path, xhr: true
    assert_response :success
  end

  test "should get edit" do
    get edit_expense_path(expenses(:roadTrip)), xhr: true # To test AJAX requests
    assert_response :success
  end

  test "should create a new expense" do
    assert_difference "Expense.count" do
      post expenses_path(expense: { type: "payment", date: Date.current, concept: "Concept", amount: 5000, category_id: categories(:education).id }), xhr: true
    end
    expense = Expense.last
    assert_equal "payment", expense.type
    assert_equal Date.current, expense.date
    assert_equal "Concept", expense.concept
    assert_equal 5000, expense.amount
    assert_equal categories(:education).id, expense.category_id
  end

  test "should destroy a expense" do
    assert_difference "Expense.count", -1 do
      delete expense_path(expenses(:school)), xhr: true
    end
  end
end
