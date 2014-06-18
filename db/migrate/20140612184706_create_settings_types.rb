class CreateSettingsTypes < ActiveRecord::Migration
  def change
    create_table :settings_types do |t|
      t.string :description
      t.string :internal_symbol

      t.timestamps
    end
  end
end
