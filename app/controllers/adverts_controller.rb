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
    
    
    @city_name = current_user.city ? current_user.city.name : current_user.custom_city

    
  end
  def index
    
    @my_cars = Car.all_items_by_user(current_user.id)

    @paginate_cars = Car.joins(:engine).includes(:engine).select('cars.id, cars.name, cars.model_id, cars.engine_id, cars.created_at, cars.updated_at, engines.id, engines.name').order(sort_column + " " + sort_direction).paginate(:page => params[:page], :per_page => 5)
    
    
    # Не рационально
    #@paginate_cars = Car.select('id, name, model_id, engine_id').order(sort_column + " " + sort_direction).paginate(:page => params[:page], :per_page => 5)
  end
  
  def edit
      @engines = Engine.all
      @car = Car.find(params[:id])
    redirect_to root_path if @car.user_id != current_user.id
  end
  
  def update
    @car = Car.find(params[:id])
    
    if @car.update_attributes(:name => params[:car][:name],
     :engine_id => params[:engine_id], 
     :city_id => current_user.city_id, :area_id => current_user.area_id)
      redirect_to root_path
    end
  end
  
  def get_models_by_brand
    @brand_name = params[:brand_name]
    @models_by_brand = Model.where(:brand_id => params[:brand_id])
  end
  def set_model
    @model_name = params[:model_name]
    @model_id = params[:model_id]
    
    @category_by_model = Category.find_by_id(params[:category_id])    
    
    @car = Car.new(:model_id => params[:model_id])    
    
    @engines = Engine.all
  end
  def create   
    @car = Car.new(:name => params[:car][:name],
     :model_id => params[:model_id], 
     :engine_id => params[:engine_id], 
     :city_id => current_user.city_id, :area_id => current_user.area_id,
     :user_id => current_user.id)
    @car.save
     
    redirect_to new_advert_path
  end
  def create_adv
    #@car = Car.new(:name => params[:name], :model_id => params[:model_id])
   # @car.save # Исправить
  end
  
  
  
    private
  
  def sort_column
    Car.column_names.include?(params[:sort]) ? params[:sort] : "cars.name"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
    
end
