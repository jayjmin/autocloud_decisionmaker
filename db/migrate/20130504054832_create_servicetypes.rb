class CreateServicetypes < ActiveRecord::Migration
  def change
    create_table :servicetypes do |t|
      t.string :stype
      t.integer :contract_day
      t.boolean :isstable
      t.boolean :isflexiblefee

      t.timestamps
    end
  end
end
