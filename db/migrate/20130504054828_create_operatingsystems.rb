class CreateOperatingsystems < ActiveRecord::Migration
  def change
    create_table :operatingsystems do |t|
      t.string :name

      t.timestamps
    end
  end
end
