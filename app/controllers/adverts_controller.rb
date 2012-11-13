class AdvertsController < ApplicationController
  
  helper_method :sort_column, :sort_direction
  
  def new
    @all_brands = Brand.all
    #@models_by_brand = 
    
    # Не используется
     @all_categories = Category.all
     @all_brands = Brand.all
     @all_models = Model.all
     
     
    @category = Category.first       
    @models = @category.models
    @brands = @category.brands
    
    @all_cars = Car.all
    
    
  end
  def index
    @paginate_cars = Car.order(sort_column + " " + sort_direction).paginate(:page => params[:page], :per_page => 5)
  end
  
  def get_models_by_brand
    @brand_name = params[:brand_name]
    @models_by_brand = Model.where(:brand_id => params[:brand_id])
  end
  def set_model
    @model_name = params[:model_name]
    @model_id = params[:model_id]
    
    @category_by_model = Category.find_by_id(params[:category_id])    
    
    @car = Car.new
  end
  def create_adv
    @car = Car.new(:name => params[:name], :model_id => params[:model_id])
    @car.save # Исправить
  end
  
  
  
    private
  
  def sort_column
    Car.column_names.include?(params[:sort]) ? params[:sort] : "name"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
    
end
