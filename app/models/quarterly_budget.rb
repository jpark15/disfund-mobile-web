class QuarterlyBudget < ActiveRecord::Base
  
  has_many :expenditures
 
  validates_associated :expenditures

  before_validation :set_default_values

  validates :year, numericality: { only_integer: true }, presence: true
  validate :year_has_four_digits

  validates :quarter, numericality: { only_integer: true }, presence: true
  validate :quarter_is_between_one_and_four

  validates :start_balance, numericality: true, presence: true

  validate :quarterly_budget_does_not_exist

  # Custom Validations
  def quarterly_budget_does_not_exist
    if QuarterlyBudget.where(quarter: quarter, year: year).any?
      errors.add(:quarterly_budget, "already exists")
    end
  end

  def quarter_is_between_one_and_four
    unless quarter.nil? || quarter >= 1 && quarter <= 4
      errors.add(:quarter, "has invalid value")
    end
  end

  def year_has_four_digits
    unless year.to_s.length == 4
      errors.add(:year, "has invalid number of digits")
    end
  end

  # Other Methods
  def end_balance_to_s
    end_balance ? number_to_currency(end_balance) : '---'
  end

  def set_default_values
    end_balance = nil
  end

  def set_end_balance
    update_attribute(end_balance: current_balance)
  end

  def current_balance
    start_balance - total_costs
  end

  def total_costs
    expenditures.sum(:cost)
  end

  def to_s
    "#{year}-Q#{quarter}"
  end
end
