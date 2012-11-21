class AddCistomCityToUser < ActiveRecord::Migration
  def change
    add_column :users, :custom_city, :string
  end
end
