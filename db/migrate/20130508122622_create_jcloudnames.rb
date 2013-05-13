class CreateJcloudnames < ActiveRecord::Migration
  def change
    create_table :jcloudnames do |t|
      t.references :provider
      t.references :geo
      t.string :providername
      t.string :locationname

      t.timestamps
    end
    add_index :jcloudnames, :provider_id
    add_index :jcloudnames, :geo_id
  end
end
