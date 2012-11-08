class CreateBrands < ActiveRecord::Migration
  def change
    create_table :brands do |t|
      t.string :name, :null => false, :default => ""

      t.timestamps
    end
  end
end
