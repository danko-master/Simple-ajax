class AddAreaIdToCar < ActiveRecord::Migration
  def change
    add_column :cars, :area_id, :integer
  end
end
