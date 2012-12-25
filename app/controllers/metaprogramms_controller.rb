#require 'my_module'
# http://demiazz.blogspot.ru/2011/04/ruby-rails.html

class MetaprogrammsController < ApplicationController
  include MyModule

  
  def index
    
  end
  
  def show
    args_arr = get_args params[:id]    
    @v1 = my_method params[:id], args_arr
  end
end
