class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :type_id
      t.string :name
      t.string :description
      t.decimal :cost

      t.timestamps
    end
  end
end
