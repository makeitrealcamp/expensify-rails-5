module DashboardHelper
  # DateTime methods http://api.rubyonrails.org/classes/DateTime.html

  def spent(scope)
    Expense.between(scope).sum(:amount)
  end
   
  # Method for total-box TODAY
  def today
    # rails-bestpractices.com/posts/2014/10/22/use-time-zone-now-instead-of-time-now/
    Time.zone.today.beginning_of_day..Time.zone.today.end_of_day
  end

  # Method for total-box YESTERDAY
  def yesterday
    1.day.ago.beginning_of_day..1.day.ago.end_of_day
  end

  # Method for total-box THIS MONTH
  def this_month
    Time.zone.now.beginning_of_month..Time.zone.now.end_of_month
  end

  # Method for total-box LAST MONTH
  def last_month
    1.month.ago.beginning_of_month..1.month.ago.end_of_month
  end
end
