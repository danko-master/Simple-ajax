class Area < ActiveRecord::Base
  has_many :cities
  
  attr_accessible :name
  
  scope :get_areas, select('id, name').where('id > 1')
end
