class ExpensesController < ApplicationController
  def index
    @expenses = Expense.all
    @tab = :expenses
  end
end
