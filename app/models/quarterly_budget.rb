class QuarterlyBudget < ActiveRecord::Base
  
  has_many :expenditures
 
  validates_associated :expenditures

  before_validation :set_default_values

  validates :start_balance, numericality: true, presence: true
  validates :quarter, numericality: { only_integer: true }, presence: true
  validates :year, numericality: { only_integer: true }, presence: true

  validate :quarterly_budget_does_not_exist

  def end_balance_to_s
    end_balance ? number_to_currency(end_balance) : '---'
  end

  def set_default_values
    end_balance = nil
  end

  def quarterly_budget_does_not_exist
    if QuarterlyBudget.where(quarter: quarter, year: year).any?
      errors.add(:quarterly_budget, "already exists")
    end
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
