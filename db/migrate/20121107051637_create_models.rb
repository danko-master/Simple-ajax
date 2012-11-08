class CreateModels < ActiveRecord::Migration
  def change
    create_table :models do |t|
      t.string :name, :null => false, :default => ""
      t.integer :brand_id, :null => false, :default => 0
      t.integer :category_id, :null => false, :default => 0

      t.timestamps
    end
  end
end
