class QuarterlyBudget < ActiveRecord::Base
  
  has_many :expenditures
 
  validates_associated :expenditures

  validates :start_balance, numericality: true, presence: true
  validates :current_balance, numericality: true, presence: true
  validates :end_balance, numericality: true, presence: true
  validates :quarter, numericality: { only_integer: true }, presence: true
  validates :year, numericality: { only_integer: true }, presence: true

  def to_s
    "#{year}-Q#{quarter}"
  end
end
