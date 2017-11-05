class ExpensesController < ApplicationController
  def index
    type_id = params[:type_id] unless params[:type_id] == nil
    category_id = params[:category_id] unless params[:category_id] == nil

    @categories = Category.all
    @types = Type.all
    @months = []
    12.times do |i|
      @months << DateTime.now.months_ago(i)
    end
    @current_month = @months[params[:month_filter].to_i]
    month = @current_month.month
    year = @current_month.year
    puts "MONTH: #{@current_month.month}"
    puts "YEAR: #{@current_month.year}"
    puts "TYPE_ID: #{type_id}"
    puts "CATEGORY_ID: #{category_id}"


    if category_id == nil && type_id == nil
      # @expenses = Expense.all
      @expenses = Expense.find_year(year).find_month(month)
    else
      @expenses = Expense.find_category(category_id).find_type(type_id) if (category_id != nil && type_id != nil)
      @expenses = Expense.find_category(category_id) if (category_id != nil && type_id == nil)
      @expenses = Expense.find_type(type_id) if (category_id == nil && type_id != nil)
    end
  end

  def new
    @expense = Expense.new
  end

  def create

  end

  protected

  def safe_params
    params.require(:expense).permit(:type_id, :date, :concept, :category_id, :amount)
  end

end
