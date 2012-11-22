class RegistrationsController < Devise::RegistrationsController
  def edit
      #@area = City.get_area_by_city(current_user.city_id)      
    @city = City.get_city(current_user.city_id) if current_user.city_id
    @area = Area.get_area(current_user.area_id) if current_user.area_id
    
    @message_city = ''
    @city_name = ''
    @message_area = ''
    @area_name = ''
    
    if @area && @city
      @city_name = @city.name
      @area_name = @area.name
      
      case @city.type_id
      when 1..2
        @message_city = t('form.city')
      when 3
        @message_city = t('form.pgt')
      when 4
        @message_city = t('form.village')
      end

      @message_area = t('form.area')
    end
    
    
    if @area && current_user.custom_city
      @city_name = current_user.custom_city
      @message_city = t('form.village')
      
      @area_name = @area.name
      @message_area = t('form.area')
    end
    
    render :edit    
  end
  def update
    @user = User.find(current_user.id)
    email_changed = @user.email != params[:user][:email]
    password_changed = !params[:user][:password].empty?
    
    successfully_updated = if email_changed or password_changed
      @user.update_with_password(params[:user])
    else
      @user.update_without_password(params[:user])
    end

    if successfully_updated
      # Sign in the user bypassing validation in case his password changed
      sign_in @user, :bypass => true
      redirect_to edit_user_registration_path
    else
      render "edit"
    end
  end
  def set_area_by_city
    @city_id = params[:city_id]
    @city_name = params[:city_name]
    @type_id = params[:city_type_id]
    
    @area = City.get_area_by_city(@city_id)

    @user = User.find(current_user.id)
    #@user.update(:area_id => @area.id, :city_id => @city_id)
    @user.update_without_password(:area_id => @area.id, :city_id => @city_id, :custom_city => nil)

  end
  def get_cities
  end
  def get_areas    
  end
  def set_custom_area   
    @area_id = params[:area_id] 
    @area_name = params[:area_name]
    
    @user = User.find(current_user.id)
    #@user.update_without_password(:area_id => @area_id, :city_id => nil)
  end
  def set_custom_city   
    @area_id = params[:area_id] 
    @area_name = params[:area_name]
    
    @custom_city = params[:user][:custom_city]
    
    @user = User.find(current_user.id)
    @user.update_without_password(:area_id => @area_id, :city_id => nil, :custom_city => @custom_city)
  end
#  def set_city_by_area
#    @area_id = params[:area_id]
#    @area_name = params[:area_name]
#    
#    @user.update_without_password(:area_id => @area.id, :city_id => 0)
#  end
end