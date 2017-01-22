class Api::V1::ExpensesController < ApplicationController
	skip_before_action :verify_authenticity_token

	def index
		@expenses = Expense.all
		render json: @expenses
	end

	def create
		expense = Expense.new(expense_params)
		if expense.save
			render  status: 201, json: expense
		else
			render  status: 422, json: { errors: expense.errors } 
		end
	end

	def update
		expense = Expense.find(params[:id])
		if expense.update(expense_params)
			render  status: 200, json: expense
		else
			render  status: 422, json: { errors: expense.errors } 
		end
	end

	def destroy
		expense = Expense.find(params[:id])
		if expense.destroy
			render status:204, nothing: true
		end
	end



	private
	def expense_params
		params.require(:expense).permit(:concept, :value, :date, :category_id, :type_id)
	end

end