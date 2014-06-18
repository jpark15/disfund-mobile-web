class CreateQuarterlyBudgets < ActiveRecord::Migration
  def change
    create_table :quarterly_budgets do |t|
      t.decimal :start_balance, :precision => 8 :scale => 2
      t.decimal :current_balance, :precision => 8, :scale => 2
      t.decimal :end_balance, :precision => 8, :scale => 2
      t.integer :quarter
      t.integer :year

      t.timestamps
    end
  end
end
