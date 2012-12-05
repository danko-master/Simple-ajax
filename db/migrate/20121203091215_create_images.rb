class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.attachment :image
      t.integer :car_id
      t.integer :order_id


      t.timestamps
    end
  end
end
