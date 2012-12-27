# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Rake::Task['db:reset'].invoke


type_1 = Type.create! :name => 'Capital'
type_2 = Type.create! :name => 'City'
type_3 = Type.create! :name => 'PGT'
type_4 = Type.create! :name => 'Village'
type_5 = Type.create! :name => 'Custom'

#area_0 = Area.create! :name => 'NA'
area_1 = Area.create! :name => 'Area 1 for Capital'
area_2 = Area.create! :name => 'Area 2'
area_3 = Area.create! :name => 'Area 3'
area_4 = Area.create! :name => 'Area 4'
area_5 = Area.create! :name => 'Area 5'


city_02 = City.create! :name => 'City 0_2', :area_id => area_2.id, :type_id => type_5.id, :is_center => false
city_03 = City.create! :name => 'City 0_3', :area_id => area_3.id, :type_id => type_5.id, :is_center => false
city_04 = City.create! :name => 'City 0_4', :area_id => area_4.id, :type_id => type_5.id, :is_center => false
city_05 = City.create! :name => 'City 0_5', :area_id => area_5.id, :type_id => type_5.id, :is_center => false
#city_0 = City.create! :name => 'Utochnit naselennii punkt', :area_id => area_0.id, :type_id => type_0.id, :is_center => false

city_1 = City.create! :name => 'City 1 Capital', :area_id => area_1.id, :type_id => type_1.id, :is_center => true

city_2 = City.create! :name => 'City 2_center', :area_id => area_2.id, :type_id => type_2.id, :is_center => true
city_4 = City.create! :name => 'City 4_city', :area_id => area_2.id, :type_id => type_2.id, :is_center => false
city_5 = City.create! :name => 'City 5_pgt', :area_id => area_2.id, :type_id => type_3.id, :is_center => false
city_6 = City.create! :name => 'City 6_village', :area_id => area_2.id, :type_id => type_4.id, :is_center => false

city_3 = City.create! :name => 'City 3_center', :area_id => area_3.id, :type_id => type_2.id, :is_center => true
city_7 = City.create! :name => 'City 7_city', :area_id => area_3.id, :type_id => type_2.id, :is_center => false
city_8 = City.create! :name => 'City 8_city', :area_id => area_3.id, :type_id => type_2.id, :is_center => false
city_9 = City.create! :name => 'City 9_pgt', :area_id => area_3.id, :type_id => type_3.id, :is_center => false


city_10 = City.create! :name => 'City 10_village', :area_id => area_4.id, :type_id => type_4.id, :is_center => true
city_11 = City.create! :name => 'City 11_village', :area_id => area_4.id, :type_id => type_4.id, :is_center => false
city_12 = City.create! :name => 'City 12_pgt', :area_id => area_4.id, :type_id => type_3.id, :is_center => false
city_13 = City.create! :name => 'City 13_pgt', :area_id => area_4.id, :type_id => type_3.id, :is_center => false

city_14 = City.create! :name => 'City 14_village', :area_id => area_5.id, :type_id => type_4.id, :is_center => true
city_15 = City.create! :name => 'City 15_village', :area_id => area_5.id, :type_id => type_4.id, :is_center => false
city_16 = City.create! :name => 'City 16_village', :area_id => area_5.id, :type_id => type_4.id, :is_center => false
city_17 = City.create! :name => 'City 17_pgt', :area_id => area_5.id, :type_id => type_3.id, :is_center => false


admin_user = User.create! :name => 'Administrator', :email => '111@example.com', :password => '112233', :password_confirmation => '112233', :phone_number => 1114567890, :area_id => 1, :city_id => 1

#admin_role = Role.create! :name => 'admin', :created_at => Time.now, :updated_at => Time.now

Role.create([{:name => 'admin'},{:name => 'manager'},{:name => 'partner'},:name => 'citizen'], :without_protection => true)
admin_user.add_role :admin

#Role.create! :name => 'partner', :created_at => Time.now, :updated_at => Time.now, :without_protection => true)
#Role.create! :name => 'citizen', :created_at => Time.now, :updated_at => Time.now, :without_protection => true)

#sql = ActiveRecord::Base.connection();
#sql.execute("INSERT INTO 'users_roles'('user_id', 'role_id') values('#{admin_user.id}', '#{admin_role.id}')")


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

eng_1 = Engine.create :name => 'Benzin'
eng_2 = Engine.create :name => 'Diesel'
eng_3 = Engine.create :name => 'Hybrid'
eng_4 = Engine.create :name => 'Electro'


Car.create :name => 'Car 11 1', :model_id => model_11.id, :city_id => city_1.id, :engine_id => eng_1.id, :mileage => 100000
Car.create :name => 'Car 11 2', :model_id => model_11.id, :city_id => city_1.id, :engine_id => eng_2.id, :mileage => 150000, :user_id => admin_user.id
Car.create :name => 'Car 11 3', :model_id => model_11.id, :city_id => city_1.id, :engine_id => eng_2.id, :mileage => 200000, :user_id => admin_user.id
Car.create :name => 'Car 12 1', :model_id => model_12.id, :city_id => city_1.id, :engine_id => eng_1.id, :mileage => 340000, :user_id => admin_user.id
Car.create :name => 'Car 12 2', :model_id => model_12.id, :city_id => city_1.id, :engine_id => eng_1.id, :mileage => 6000, :user_id => admin_user.id
Car.create :name => 'Car 11 4', :model_id => model_11.id, :city_id => city_2.id, :engine_id => eng_3.id, :mileage => 80000
Car.create :name => 'Car 11 5', :model_id => model_11.id, :city_id => city_2.id, :engine_id => eng_3.id, :mileage => 65000, :user_id => admin_user.id
Car.create :name => 'Car 11 6', :model_id => model_11.id, :city_id => city_3.id, :engine_id => eng_3.id, :mileage => 90000, :user_id => admin_user.id
Car.create :name => 'Car 11 7', :model_id => model_11.id, :city_id => city_3.id, :engine_id => eng_1.id, :mileage => 4000
Car.create :name => 'Car 13 1', :model_id => model_13.id, :city_id => city_1.id, :engine_id => eng_1.id, :mileage => 500000, :user_id => admin_user.id
Car.create :name => 'Car 13 2', :model_id => model_13.id, :city_id => city_1.id, :engine_id => eng_1.id, :mileage => 45000, :user_id => admin_user.id
Car.create :name => 'Car 13 3', :model_id => model_13.id, :city_id => city_1.id, :engine_id => eng_4.id, :mileage => 1000, :user_id => admin_user.id
Car.create :name => 'Car 13 4', :model_id => model_13.id, :city_id => city_1.id, :engine_id => eng_1.id, :mileage => 97000, :user_id => admin_user.id
Car.create :name => 'Car 31 1', :model_id => model_31.id, :city_id => city_1.id, :engine_id => eng_1.id, :mileage => 24000, :user_id => admin_user.id
Car.create :name => 'Car 31 2', :model_id => model_31.id, :city_id => city_1.id, :engine_id => eng_1.id, :mileage => 58000
Car.create :name => 'Car 11 8', :model_id => model_11.id, :city_id => city_2.id, :engine_id => eng_4.id, :mileage => 145000, :user_id => admin_user.id
Car.create :name => 'Car 11 9', :model_id => model_11.id, :city_id => city_2.id, :engine_id => eng_1.id, :mileage => 234000
Car.create :name => 'Car 11 10', :model_id => model_11.id, :city_id => city_3.id, :engine_id => eng_1.id, :mileage => 340000, :user_id => admin_user.id
Car.create :name => 'Car 11 11', :model_id => model_11.id, :city_id => city_3.id, :engine_id => eng_1.id, :mileage => 138000, :user_id => admin_user.id
Car.create :name => 'Car 11 12', :model_id => model_11.id, :city_id => city_2.id, :engine_id => eng_4.id, :mileage => 30000, :user_id => admin_user.id
Car.create :name => 'Car 11 13', :model_id => model_11.id, :city_id => city_2.id, :engine_id => eng_1.id, :mileage => 4000
Car.create :name => 'Car 11 14', :model_id => model_11.id, :city_id => city_3.id, :engine_id => eng_2.id, :mileage => 8000, :user_id => admin_user.id
Car.create :name => 'Car 11 15', :model_id => model_11.id, :city_id => city_3.id, :engine_id => eng_2.id, :mileage => 43000, :user_id => admin_user.id
Car.create :name => 'Car 11 16', :model_id => model_11.id, :city_id => city_1.id, :engine_id => eng_2.id, :mileage => 22000, :user_id => admin_user.id
Car.create :name => 'Car 11 17', :model_id => model_11.id, :city_id => city_1.id, :engine_id => eng_2.id, :mileage => 79000
Car.create :name => 'Car 11 18', :model_id => model_11.id, :city_id => city_1.id, :engine_id => eng_2.id, :mileage => 123000, :user_id => admin_user.id
Car.create :name => 'Car 11 19', :model_id => model_11.id, :city_id => city_1.id, :engine_id => eng_1.id, :mileage => 500, :user_id => admin_user.id
Car.create :name => 'Car 11 20', :model_id => model_11.id, :city_id => city_1.id, :engine_id => eng_2.id, :mileage => 43000
Car.create :name => 'Car 11 21', :model_id => model_11.id, :city_id => city_1.id, :engine_id => eng_2.id, :mileage => 20000, :user_id => admin_user.id
Car.create :name => 'Car 11 22', :model_id => model_11.id, :city_id => city_1.id, :engine_id => eng_3.id, :mileage => 170000, :user_id => admin_user.id
Car.create :name => 'Car 11 23', :model_id => model_11.id, :city_id => city_1.id, :engine_id => eng_3.id, :mileage => 115000
Car.create :name => 'Car 11 24', :model_id => model_11.id, :city_id => city_1.id, :engine_id => eng_1.id, :mileage => 96000, :user_id => admin_user.id





