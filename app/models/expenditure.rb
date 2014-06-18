class Expenditure < ActiveRecord::Base
  belongs_to :quarterly_budget
  belongs_to :settings_type
end
