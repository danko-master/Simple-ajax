class Car < ActiveRecord::Base
  belongs_to :engine
  belongs_to :user
  
  attr_accessible :name, :model_id, :city_id, :area_id, :engine_id, :user_id
  
  validates :name, :presence => true
  validates_numericality_of :model_id, :only_integer => true

  def self.all_items_by_user(current_user_id)
    where({:user_id => current_user_id}).order("updated_at DESC")
  end
              
end
