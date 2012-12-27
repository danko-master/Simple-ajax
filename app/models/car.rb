class Car < ActiveRecord::Base
  belongs_to :engine
  belongs_to :user
  
  has_many :images, :dependent => :delete_all
  
  attr_accessible :name, :model_id, :city_id, :area_id, :engine_id, :user_id, :mileage
  
  validates :name, :presence => true
  validates_numericality_of :model_id, :only_integer => true
  
  # Sphinx
  define_index do
    indexes name
    indexes model_id
    indexes city_id
    indexes area_id
    indexes engine_id
    indexes user_id
    indexes mileage
    #indexes :name, :sortable => true
    #indexes comments.content, :as => :comment_content
    #indexes [author.first_name, author.last_name], :as => :author_name
    
    #has author_id, created_at
  end
  
  sphinx_scope(:by_model_id) { |id|
    {:conditions => {:model_id => id}}
  }
  sphinx_scope(:by_engine_id) { |id|
    {:conditions => {:engine_id => id}}
  }
  sphinx_scope(:by_city_id) { |id|
    {:conditions => {:city_id => id}}
  }
  
  # end of Sphinx

  def self.all_items_by_user(current_user_id)
    where({:user_id => current_user_id}).order("updated_at DESC")
  end
  
  
  #def cars
  #  @search ||= find_cars
  #end
  
#private

 # def find_cars
 #   cars = Product.order(:name)
 #   #cars = products.where("name like ?", "%#{keywords}%") if keywords.present?
 #   cars = cars.where(model_id: model_id) if model_id.present?
 #   cars = cars.where(engine_id: engine_id) if engine_id.present?
 #   cars = cars.where(city_id: city_id) if city_id.present?
 #   cars = cars.where("mileage >= ?", min_mileage) if min_mileage.present?
 #   cars = cars.where("mileage <= ?", max_mileage) if max_mileage.present?
 #   cars
 # end

              
end
