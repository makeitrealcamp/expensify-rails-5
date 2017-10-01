class ExpensesController < ApplicationController
  def index
    # current_date = Date.today
    # current_month = current_date.strftime('%B')
    @expenses = Expense.where("category_id >= :category AND type_id <= :type" {category: params[:category_filter], type: params[:type_filter]})
    @categories = Category.all
    @types = Type.all
  end
end
