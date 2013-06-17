class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.string :carname
      t.string :yearofrelease
      t.integer :price
      t.text :describtion

      t.timestamps
    end
  end
end
