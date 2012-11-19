class City < ActiveRecord::Base
  belongs_to :area, :select => [:id, :name]
  
  attr_accessible :name, :area_id, :type_id, :is_center
  
  scope :is_capital, where(:type_id => 1) 
  scope :is_city, where(:type_id => 2)

  scope :is_capital_and_city, where(:type_id => 1..2)
  
  scope :get_capital_and_city, select('id, name, area_id').is_capital_and_city
  
  def self.get_area_by_city(city_id)
    select(:area_id).find(city_id).area
  end    
end
