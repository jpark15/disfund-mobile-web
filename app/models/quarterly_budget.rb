class QuarterlyBudget < ActiveRecord::Base
  has_many :expenditures

  def to_s
    "#{year}-Q#{quarter}"
  end

end
