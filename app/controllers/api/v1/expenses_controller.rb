class Api::V1::ExpensesController < ApplicationController
	def index
		@expenses = Expense.all
		render json: @expenses
	end
end
