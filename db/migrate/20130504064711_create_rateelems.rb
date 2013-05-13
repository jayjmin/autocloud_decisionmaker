class CreateRateelems < ActiveRecord::Migration
  def change
    create_table :rateelems do |t|
      t.references :rate
      t.string :item
      t.integer :period_hour
      t.float :price_period

      t.timestamps
    end
    add_index :rateelems, :rate_id
  end
end
