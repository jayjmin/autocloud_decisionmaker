class CreateRates < ActiveRecord::Migration
  def change
    create_table :rates do |t|
      t.references :resourceset
      t.references :servicetype
      t.references :operatingsystem
      t.references :geo

      t.timestamps
    end
    add_index :rates, :resourceset_id
    add_index :rates, :servicetype_id
    add_index :rates, :operatingsystem_id
    add_index :rates, :geo_id
  end
end
