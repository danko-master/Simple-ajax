class AddMileageToCar < ActiveRecord::Migration
  def change
    add_column :cars, :mileage, :bigint
  end
end
