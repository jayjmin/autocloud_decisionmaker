class CreateGeos < ActiveRecord::Migration
  def change
    create_table :geos do |t|
      t.string :city
      t.string :continent

      t.timestamps
    end
  end
end
