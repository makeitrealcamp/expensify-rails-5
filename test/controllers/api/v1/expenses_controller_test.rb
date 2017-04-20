require 'test_helper'

class Api::V1::ExpensesControllerTest < ActionDispatch::IntegrationTest
  test "get index response should be success" do
    get api_v1_expenses_path, xhr: true
    assert_response :success
  end

  test "get index should return list of expenses" do
    get api_v1_expenses_path, xhr: true

    body = JSON.parse(response.body)
    assert_not_nil body
    assert_equal 2, body.length
  end

  test "create response should be success" do
    post api_v1_expenses_path, params: { expense: { type: "purchase", date: Date.current, concept: "The concept", category_id: categories(:travel).id, amount: 3450 } }, xhr: true
    assert_response :success
  end

  test "should create expense" do
    assert_difference "Expense.count" do
      post api_v1_expenses_path, params: { expense: { type: "payment", date: Date.current, concept: "The concept", category_id: categories(:travel).id, amount: 3450 } }, xhr: true
    end
  end

  test "should not create an expense without concept" do
    assert_no_difference "Expense.count" do
      post api_v1_expenses_path, params: { expense: { type: "payment", date: Date.current, category_id: categories(:travel).id, amount: 1000 } }, xhr: true
    end
  end

  test "update response should be success" do
    patch api_v1_expense_path(expenses(:roadTrip)), params: { expense: { type: :purchase, date: Date.current, concept: "Blablabla", category_id: categories(:education).id, amount: 3400 } }, xhr: true
    assert_response :success
  end

  test "update should update the expense" do
    expense = expenses(:school)
    patch api_v1_expense_path(expense), params: { expense: { type: "withdrawal", date: 1.month.ago.to_date, concept: "thing", category_id: categories(:education).id, amount: 3000 } }, xhr: true

    expense.reload
    assert_equal "withdrawal", expense.type
    assert_equal 1.month.ago.to_date, expense.date
    assert_equal "thing", expense.concept
    assert_equal categories(:education), expense.category
    assert_equal 3000, expense.amount
  end

  test "delete response should be success" do
    delete api_v1_expense_path(expenses(:roadTrip))
    assert_response :success
  end

  test "delete should delete the expense" do
    assert_difference "Expense.count", -1 do
      delete api_v1_expense_path(expenses(:roadTrip))
    end
  end

end