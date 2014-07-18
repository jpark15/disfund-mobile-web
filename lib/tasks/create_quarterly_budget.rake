task :check_date_for_new_quarterly_budget => :environment do
  # if Time.now.day == 1 && Time.now.month%3 == 1
  if 1 == 1 && 4%3 == 1
    # month = Time.now.month
    month = 10
    if month < 4
      quarter = 1
    elsif month < 7
      quarter = 2
    elsif month < 10
      quarter = 3
    elsif month <= 12
      quarter = 4
    end
    create_quarterly_budget(quarter)
  end
end

def create_quarterly_budget(quarter)
  roll_over = SettingsType.find_or_create_by(internal_symbol: "roll_over")
  prev_budget = QuarterlyBudget.order(quarter: :desc, year: :desc).first
  prev_budget.set_end_balance
  last_balance = prev_budget.current_balance

  # New Quarterly Budget starts with a default start balance of $3,000 (subject to change)
  new_quarterly_budget = QuarterlyBudget.create(quarter: quarter, year: Time.now.year, start_balance: 3000)

  new_expenditure = Expenditure.create(item: 'Previous Balance',
                                        cost: -1*last_balance,
                                        quarterly_budget_id: new_quarterly_budget.id,
                                        purchase_date: "#{Time.now.year}-#{Time.now.month}-#{Time.now.day}",
                                        type_id: roll_over.id,
                                        notes: "Current balance of previous Quarterly Budget",
                                        refunded: false)
end