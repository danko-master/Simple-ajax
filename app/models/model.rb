class Model < ActiveRecord::Base
   belongs_to :brand
   belongs_to :category
  
  attr_accessible :name, :brand_id, :category_id
  
 
end
