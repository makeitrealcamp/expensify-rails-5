class DashboardController < ApplicationController
  def index
    # @tab = :dashboard
    @last_6_months = generate_last_n_months (6)
    @last_6_months_expenses = Expense.where("date >= :start_date AND date <= :end_date",{start_date: DateTime.now.months_ago(6).at_beginning_of_month, end_date: DateTime.now.at_end_of_month})
    # graph-1

    # last_6.map do |e|
    #   e.date.month == 7
    # end

    @last_6_type_total = []
    
    # end graph-1

    # graph-2
    # end graph-2
    # graph-3
    # end graph-3
    # graph-4
    # end graph-4

  end
end
