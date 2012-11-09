class Car < ActiveRecord::Base
  attr_accessible :name, :model_id, :city_id
  
  validates :name, :presence => true
  validates_numericality_of :model_id, :only_integer => true
              
end
