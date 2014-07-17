class RemoveCurrentBalanceFromQuarterlyBudgets < ActiveRecord::Migration
  def change
    remove_column :quarterly_budgets, :current_balance, :decimal
  end
end
