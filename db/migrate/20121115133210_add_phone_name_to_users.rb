class AddPhoneNameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :phone_number, :integer
    add_column :users, :area_id, :integer
    add_column :users, :city_id, :integer
  end
end
