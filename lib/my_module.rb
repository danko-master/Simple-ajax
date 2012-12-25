module MyModule
  
  # Модуль вызывается в /metaprogramms/имя_раздела/
  # cars, trucks, buses
  
  #def args_trucks
  #  %w(name year price capacity)
  #end
  #
  #def args_buses
  #  %w(name year price seats)
  #end
  
  def get_args url_name
    method_name = "args_" + url_name
    
    custom_args = []
    
    # Доп аргументы для раздела
    case url_name
      when "cars"
        custom_args = ["seats", "gear_id", "drive_id"]
      when "trucks"
        custom_args = ["capacity", "suspension"]
      when "buses"
        custom_args = ["seats"]
    end
    
    class_eval do
      # Общие аргументы
      def args_general
        %w(name year price)
      end      
      # Добавим специфичные аргументы для данного раздела авто
      define_method method_name do
        ary = args_general
        custom_args.each do |carg|
          ary << carg.to_s
        end
        ary        
      end 
    end      
    
    send(method_name)
  end
  
  def my_method url_name, args_arr
    str = url_name + "_loaded: " 
    args_arr.each do |arg|
      str << " " + t('form.' + arg) + ": " + arg + "; "
    end
    
    str
  end
  
  def method_missing(meth, *args)
    #%w(no_method)
     puts "No method"
  end

end
