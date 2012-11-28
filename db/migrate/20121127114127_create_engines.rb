class CreateEngines < ActiveRecord::Migration
  def change
    create_table :engines do |t|
      t.string :name

      t.timestamps
    end
    
    add_column :cars, :engine_id, :integer
  end
end
