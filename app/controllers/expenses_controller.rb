class ExpensesController < ApplicationController
  def index
    @expenses = Expense.all
    @tab = :expenses
  end

  def new
    @expense = Expense.new
  end

  def create
    @expense = Expense.create(expenses_params)
    @expenses = Expense.all
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
    def expenses_params
      params.require(:expense).permit(:type, :date, :concept, :category_id, :amount)
    end
end
