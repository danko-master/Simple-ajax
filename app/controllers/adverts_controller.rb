class AdvertsController < ApplicationController
  def new
    @all_brands = Brand.all
    #@models_by_brand = 
    
    
    # Не используется
     @all_categories = Category.all
     @all_brands = Brand.all
     @all_models = Model.all
     
    @brand = Brand.first    
    @category = Category.first 
       
    @models = @category.models
    @brands = @category.brands
    
  
  end
end
