class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.references :provider
      t.references :operatingsystem
      t.string :imgid

      t.timestamps
    end
    add_index :images, :provider_id
    add_index :images, :operatingsystem_id
  end
end
