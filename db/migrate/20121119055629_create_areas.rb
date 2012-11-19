class CreateAreas < ActiveRecord::Migration
  def change
    create_table :areas do |t|
      t.string :name

      t.timestamps
    end
    
    add_column :cities, :area_id, :integer
    add_column :cities, :is_center, :boolean    
  end
end
