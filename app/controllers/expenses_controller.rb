class ExpensesController < ApplicationController
  before_action :authenticate_user!
  def index
    @tab = :expenses
  end
end
