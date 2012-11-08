class Category < ActiveRecord::Base
  has_many :models, :dependent => :destroy
  has_many :brands, :through => :models, :select => "DISTINCT brands.id, brands.name"
  
  attr_accessible :name
end
