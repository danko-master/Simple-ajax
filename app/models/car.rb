class Car < ActiveRecord::Base
  belongs_to :engine
  
  attr_accessible :name, :model_id, :city_id, :engine_id
  
  validates :name, :presence => true
  validates_numericality_of :model_id, :only_integer => true

              
end
