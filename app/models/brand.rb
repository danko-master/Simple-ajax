class Brand < ActiveRecord::Base
  has_many :models, :dependent => :destroy
  has_many :categories, :through => :models
  
  attr_accessible :name
end
