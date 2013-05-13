class CreateResourcesets < ActiveRecord::Migration
  def change
    create_table :resourcesets do |t|
      t.references :provider
      t.string :name
      t.float :cpu
      t.float :ram
      t.float :hdd
      t.boolean :iscustomizable

      t.timestamps
    end
    add_index :resourcesets, :provider_id
  end
end
