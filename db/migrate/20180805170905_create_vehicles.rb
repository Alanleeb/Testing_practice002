class CreateVehicles < ActiveRecord::Migration[5.2]
  def change
    create_table :vehicles do |t|
      t.string :make
      t.integer :age
      t.float :price
      t.integer :milage
      t.string :color
      t.string :inteior

      t.timestamps
    end
  end
end
