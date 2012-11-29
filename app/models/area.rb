class Area < ActiveRecord::Base
  has_many :cities
  has_many :users
  
  attr_accessible :name
  
  scope :get_areas, select('id, name').where('id > 1')
  
  def self.get_area(area_id)
    select('id, name').find(area_id)
  end 
end
