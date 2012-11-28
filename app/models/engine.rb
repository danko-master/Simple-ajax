class Engine < ActiveRecord::Base
  has_many :cars
  
  attr_accessible :name
end
