class ExpensesController < ApplicationController
  def index
    # old_type = nil
    # old_category = nil
    type_id = params[:type_id] if params[:type_id] != nil
    category_id = params[:category_id] if params[:category_id] != nil
    # old_type = type_id if type_id != nil
    # old_category = category_id if category_id != nil

    @categories = Category.all
    @types = Type.all

    puts "TYPE_ID: #{type_id}"
    puts "CATEGORY_ID: #{category_id}"

    if category_id == nil && type_id == nil
      @expenses = Expense.all
    else
      @expenses = Expense.where("category_id = ? AND type_id = ?", category_id, type_id) if (category_id != nil && type_id != nil)
      @expenses = Expense.where("category_id = ?", category_id) if (category_id != nil && type_id == nil)
      @expenses = Expense.where("type_id = ?", type_id) if (category_id == nil && type_id != nil)
    end
    # old_type = type_id
    # old_category = category_id
  end

  # private
  # def params_safe
  #
  # end
end
