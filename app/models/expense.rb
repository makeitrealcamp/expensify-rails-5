# == Schema Information
#
# Table name: expenses
#
#  id          :integer          not null, primary key
#  concept     :string
#  value       :decimal(, )
#  date        :date
#  category_id :integer
#  type_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Expense < ApplicationRecord
  belongs_to :category
  belongs_to :type
end
