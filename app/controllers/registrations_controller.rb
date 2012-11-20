class RegistrationsController < Devise::RegistrationsController
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
    
    @area = City.get_area_by_city(@city_id)
    
    puts @city_name
    puts @area.id
    puts @area.name
    
    @user = User.find(current_user.id)
    #@user.update(:area_id => @area.id, :city_id => @city_id)
    successfully_updated = @user.update_without_password(:area_id => @area.id, :city_id => @city_id)
    
    if successfully_updated
      # Sign in the user bypassing validation in case his password changed
      sign_in @user, :bypass => true
      #redirect_to edit_user_registration_path
    else
      render "edit"
    end
  end
  def set_city_by_area
    
  end
end