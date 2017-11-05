class ExpensesController < ApplicationController
  def index
    type_id = params[:type_id] unless params[:type_id] == nil
    category_id = params[:category_id] unless params[:category_id] == nil

    @categories = Category.all
    @types = Type.all
    @months = []
    12.times do |i|
      @months << DateTime.now.months_ago(i).strftime("%B %Y")
    end

    @current_month = @months[params[:month_filter].to_i]

    puts "TYPE_ID: #{type_id}"
    puts "CATEGORY_ID: #{category_id}"

    if category_id == nil && type_id == nil
      @expenses = Expense.all
    else
      @expenses = Expense.where("category_id = ? AND type_id = ?", category_id, type_id) if (category_id != nil && type_id != nil)
      @expenses = Expense.where("category_id = ?", category_id) if (category_id != nil && type_id == nil)
      @expenses = Expense.where("type_id = ?", type_id) if (category_id == nil && type_id != nil)
    end
  end
end
