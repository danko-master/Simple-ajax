# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Rake::Task['db:reset'].invoke

city_1 = City.create! :name => 'City 1'
city_2 = City.create! :name => 'City 2'
city_3 = City.create! :name => 'City 3'
city_4 = City.create! :name => 'City 4'
city_5 = City.create! :name => 'City 5'


cat_1 = Category.create! :name => 'Category 1', :alias => 'cars'
cat_2 = Category.create! :name => 'Category 2', :alias => 'trucks'
cat_3 = Category.create! :name => 'Category 3', :alias => 'buses'


brand_1 = Brand.create! :name => 'Brand 1'
brand_2 = Brand.create! :name => 'Brand 2'
brand_3 = Brand.create! :name => 'Brand 3'
brand_4 = Brand.create! :name => 'Brand 4'
brand_5 = Brand.create! :name => 'Brand 5'


model_11 = Model.create! :name => 'Model 11', :brand_id => brand_1.id, :category_id => cat_1.id
model_12 = Model.create! :name => 'Model 12', :brand_id => brand_1.id, :category_id => cat_1.id
model_13 = Model.create! :name => 'Model 13', :brand_id => brand_1.id, :category_id => cat_1.id

model_21 = Model.create! :name => 'Model 21', :brand_id => brand_2.id, :category_id => cat_1.id
model_22 = Model.create! :name => 'Model 22', :brand_id => brand_2.id, :category_id => cat_2.id
model_23 = Model.create! :name => 'Model 23', :brand_id => brand_2.id, :category_id => cat_2.id

model_31 = Model.create! :name => 'Model 31', :brand_id => brand_3.id, :category_id => cat_2.id
model_32 = Model.create! :name => 'Model 32', :brand_id => brand_3.id, :category_id => cat_2.id
model_33 = Model.create! :name => 'Model 33', :brand_id => brand_3.id, :category_id => cat_2.id

model_41 = Model.create! :name => 'Model 41', :brand_id => brand_4.id, :category_id => cat_1.id
model_42 = Model.create! :name => 'Model 42', :brand_id => brand_4.id, :category_id => cat_3.id
model_43 = Model.create! :name => 'Model 43', :brand_id => brand_4.id, :category_id => cat_3.id

model_51 = Model.create! :name => 'Model 51', :brand_id => brand_5.id, :category_id => cat_3.id
model_52 = Model.create! :name => 'Model 52', :brand_id => brand_5.id, :category_id => cat_3.id
model_53 = Model.create! :name => 'Model 53', :brand_id => brand_5.id, :category_id => cat_3.id

Car.create :name => 'Car 11 1', :model_id => model_11.id, :city_id => city_1.id
Car.create :name => 'Car 11 2', :model_id => model_11.id, :city_id => city_1.id
Car.create :name => 'Car 11 3', :model_id => model_11.id, :city_id => city_1.id
Car.create :name => 'Car 12 1', :model_id => model_12.id, :city_id => city_1.id
Car.create :name => 'Car 12 2', :model_id => model_12.id, :city_id => city_1.id
Car.create :name => 'Car 11 4', :model_id => model_11.id, :city_id => city_2.id
Car.create :name => 'Car 11 5', :model_id => model_11.id, :city_id => city_2.id
Car.create :name => 'Car 11 6', :model_id => model_11.id, :city_id => city_3.id
Car.create :name => 'Car 11 7', :model_id => model_11.id, :city_id => city_3.id
Car.create :name => 'Car 13 1', :model_id => model_13.id, :city_id => city_1.id
Car.create :name => 'Car 13 2', :model_id => model_13.id, :city_id => city_1.id
Car.create :name => 'Car 13 3', :model_id => model_13.id, :city_id => city_1.id
Car.create :name => 'Car 13 4', :model_id => model_13.id, :city_id => city_1.id
Car.create :name => 'Car 31 1', :model_id => model_31.id, :city_id => city_1.id
Car.create :name => 'Car 31 2', :model_id => model_31.id, :city_id => city_1.id
Car.create :name => 'Car 11 8', :model_id => model_11.id, :city_id => city_2.id
Car.create :name => 'Car 11 9', :model_id => model_11.id, :city_id => city_2.id
Car.create :name => 'Car 11 10', :model_id => model_11.id, :city_id => city_3.id
Car.create :name => 'Car 11 11', :model_id => model_11.id, :city_id => city_3.id
Car.create :name => 'Car 11 12', :model_id => model_11.id, :city_id => city_2.id
Car.create :name => 'Car 11 13', :model_id => model_11.id, :city_id => city_2.id
Car.create :name => 'Car 11 14', :model_id => model_11.id, :city_id => city_3.id
Car.create :name => 'Car 11 15', :model_id => model_11.id, :city_id => city_3.id
Car.create :name => 'Car 11 16', :model_id => model_11.id, :city_id => city_1.id
Car.create :name => 'Car 11 17', :model_id => model_11.id, :city_id => city_1.id
Car.create :name => 'Car 11 18', :model_id => model_11.id, :city_id => city_1.id
Car.create :name => 'Car 11 19', :model_id => model_11.id, :city_id => city_1.id
Car.create :name => 'Car 11 20', :model_id => model_11.id, :city_id => city_1.id
Car.create :name => 'Car 11 21', :model_id => model_11.id, :city_id => city_1.id
Car.create :name => 'Car 11 22', :model_id => model_11.id, :city_id => city_1.id
Car.create :name => 'Car 11 23', :model_id => model_11.id, :city_id => city_1.id
Car.create :name => 'Car 11 24', :model_id => model_11.id, :city_id => city_1.id





