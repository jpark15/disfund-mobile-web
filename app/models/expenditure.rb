class Expenditure < ActiveRecord::Base
  
  belongs_to :quarterly_budget
  belongs_to :settings_type, :class_name => "SettingsType", :foreign_key => "type_id"

  validates :quarterly_budget, presence: true
  validates :settings_type, presence: true

  validates :item, presence: true
  validates :cost, numericality: true, presence: true
  validates :quarterly_budget_id, numericality: { only_integer: true }, presence: true
  validates :purchase_date, presence: true
  validates :type_id, numericality: { only_integer: true }, presence: true
  # Do not need to validate :notes since it should be optional
  validates :refunded, inclusion: { in: [true, false] }

end
