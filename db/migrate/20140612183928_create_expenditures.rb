class CreateExpenditures < ActiveRecord::Migration
  def change
    create_table :expenditures do |t|
      t.string :item
      t.decimal :cost, :precision => 8, :scale => 2
      t.integer :quarterly_budget_id
      t.date :purchase_date
      t.integer :type_id
      t.string :notes
      t.boolean :refunded, :default => false

      t.timestamps
    end
  end
end
