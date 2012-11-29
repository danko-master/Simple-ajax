class City < ActiveRecord::Base
  belongs_to :area, :select => [:id, :name]
  has_many :users
  
  attr_accessible :name, :area_id, :type_id, :is_center
  
  scope :is_capital, where(:type_id => 1) 
  scope :is_city, where(:type_id => 2)
  scope :is_pgt, where(:type_id => 3)
  scope :is_village, where(:type_id => 4)
  scope :is_center_area, where(:is_center => true)

  scope :is_capital_and_city, where(:type_id => 1..2)  
  scope :get_capital_and_city, select('id, name, area_id, type_id').is_capital_and_city
  scope :get_pgt, select('id, name, area_id, type_id').is_pgt 
  scope :get_village_center, select('id, name, area_id, type_id').is_village.is_center_area
  
  def self.get_area_by_city(city_id)
    select(:area_id).find(city_id).area
  end   
  def self.get_city(city_id)
    select('id, name, area_id, type_id, is_center').find(city_id)
  end 
end
