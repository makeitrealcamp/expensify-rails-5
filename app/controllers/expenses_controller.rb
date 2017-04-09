class ExpensesController < ApplicationController
  def index
    @month = Date.new(year(params), month(params), 1)
    # Filter by month
    @expenses = Expense.between(@month..@month.end_of_month).order("date DESC")
    @tab = :expenses
  end

  def new
    @expense = Expense.new
  end

  def create
    @expense = Expense.create(expenses_params)
    
    @month = Date.new(year(params), month(params), 1)
    @expenses = Expense.between(@month..@month.end_of_month).order("date DESC")
  end

  def edit
    @expense = Expense.find(params[:id])
  end

  def update
    @expense = Expense.find(params[:id])
    @expense.update(expenses_params)
    
    @month = Date.new(year(params), month(params), 1)
    @expenses = Expense.between(@month..@month.end_of_month).order("date DESC")
  end

  def destroy
    @expense = Expense.destroy(params[:id])
    
    @month = Date.new(year(params), month(params), 1)
    @expenses = Expense.between(@month..@month.end_of_month).order("date DESC")
  end

  private
    def expenses_params
      params.require(:expense).permit(:type, :date, :concept, :category_id, :amount)
    end

    def year(params)
      params[:year] ? params[:year].to_i : Date.current.year
    end

    def month(params)
      params[:month] ? params[:month].to_i : Date.current.month
    end
end
