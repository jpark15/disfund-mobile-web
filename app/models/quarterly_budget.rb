class QuarterlyBudget < ActiveRecord::Base
  has_many :expenditures

  def quarteryear
    "#{year}-Q#{quarter}"
  end

end
