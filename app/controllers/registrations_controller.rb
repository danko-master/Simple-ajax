class RegistrationsController < Devise::RegistrationsController
  def edit
    if current_user.city_id
      @area = City.get_area_by_city(current_user.city_id)
      @city = City.get_city(current_user.city_id)
    end
    
    @message_city = ''
    @message_area = ''
    
    if @city && @area
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
    @user.update_without_password(:area_id => @area.id, :city_id => @city_id)

  end
#  def set_city_by_area
#    @area_id = params[:area_id]
#    @area_name = params[:area_name]
#    
#    @user.update_without_password(:area_id => @area.id, :city_id => 0)
#  end
end