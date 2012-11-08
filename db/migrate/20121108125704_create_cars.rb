class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.string :name
      t.integer :model_id
      t.integer :city_id

      t.timestamps
    end
  end
end
