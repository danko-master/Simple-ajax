class AdvertsController < ApplicationController
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
    
  
  end
  
  def get_models_by_brand
    @brand_name = params[:brand_name]
    @models_by_brand = Model.where(:brand_id => params[:brand_id])
  end
  def set_model
    @model_name = params[:model_name]
    @category_by_model = Category.find_by_id(params[:category_id])    
  end
end
