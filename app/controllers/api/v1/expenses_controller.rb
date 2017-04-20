class Api::V1::ExpensesController < ApplicationController
  protect_from_forgery with: :null_session

  def index
    expenses = Expense.all.paginate(page: params[:page], per_page: 5).order("id")
    expenses = expenses.where(type: params[:type]) if params[:type]
    expenses = expenses.where(category_id: params[:category_id]) if params[:category_id]
    
    render json: JSON.pretty_generate(JSON.parse(expenses.to_json))
  end

  def create
    expense = Expense.new(expense_params)
    if expense.save
      render json: expense, status: 201
    else
      render json: { errors: expense.errors }, status: 422
    end
  end

  def update
    expense = Expense.find(params[:id])
    if expense.update(expense_params)
      render json: expense, status: 200
    else
      render json: { errors: expense.errors }, status: 422
    end
  end

  def destroy
    expense = Expense.find(params[:id])
    expense.destroy
    head 204
  end

  private
    def expense_params
      params.require(:expense).permit(:type, :date, :concept, :category_id, :amount)
    end
end