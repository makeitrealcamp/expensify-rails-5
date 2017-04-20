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

  # Methods for Last 6 months graphic
  def month(data)
    data.map { |tx| tx[:date] = l(tx[:date], format: "%b '%y") } 
    data.to_json.html_safe
  end

  def type(scope)
    Expense.type(scope)
  end

  def last_six_months
    5.months.ago.beginning_of_month..Time.zone.now.end_of_day
  end

  # Methods for By day graphic
  def day(data)
    data.map { |tx| tx[:date] = l(tx[:date], format: "%d") }
    data.to_json.html_safe
  end

  def type_day(scope)
    Expense.type_day(scope)
  end

  def current_month
    Time.zone.now.beginning_of_month..Time.zone.now.end_of_day
  end

  def past_month
    1.month.ago.beginning_of_month..1.month.ago.end_of_month
  end

  def by_day
    scope = params[:day]
    if scope == "past_month"
      past_month
    else
      current_month
    end
  end

  # Method for Category graphic
  def category(scope)
    Expense.category(scope).map do |key, value|
        { y: value, label: key ? Category.find(key).name : "No found" }
    end
  end

  # Method for Accumulated graphic
  def accumulated(scope)
    Expense.accumulated(scope)
  end

  def accumulated_curren_month
    range = params[:accumulated]
    if range == "past_month"
      past_month
    else
      current_month
    end
  end

  def accumulated_past_month
    range = params[:accumulated]
    if range == "past_month"
      before_past_month 
    else
      past_month
    end
  end
end
