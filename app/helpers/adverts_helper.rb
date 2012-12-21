module AdvertsHelper
  def cities
    City.get_capital_and_city
  end
  def pgt
    City.get_pgt
  end
  def village
    City.get_village_center
  end
  def areas
    Area.get_areas
  end
  
  
  #def checkbox_bootstrap_tag(engines, car_engine_id)   
  #  content_tag :div, :class=>"btn-group", "data-toggle"=>"buttons-radio" do
  #    engines.each do |e|
  #      content_tag :button, :type => :button,
  #      :class=>'btn #{car_engine_id == #{e.id}.to_i ? "active" : ""}',
  #      "data-toggle"=>"button", 
  #      :onclick=>"javascript:document.getElementById('car_input_engine_id').value=#{e.id}" do
  #         e.name       
  #      end
  #    end
  #    content_tag :input, :type => :hidden, :id=>"car_input_engine_id", :name=>"car[input_engine_id]", :value=>car_engine_id
  #  end
  #end
  
  
  def radio_bootstrap_tag(collection, car_item_id, item_name)
    input_id = "car_input_" + item_name + "_id"
    input_name = "car[input_" + item_name + "_id]"
    
    content_tag :div, :class=>"btn-group", "data-toggle"=>"buttons-radio" do
      engines_html = collection.map do |e|
          content_tag :button, 
            :type => :button,
            :class=> %[btn #{car_item_id == e.id ? "active" : ""}], 
            #:data => {:toggle => "button"},
            :onclick=> "javascript:document.getElementById('#{input_id}').value=#{e.id}" do
              e.name       
          end
        end
      safe_join(engines_html) +
        tag(:input, :type => :hidden, :id=>input_id, :name=>input_name, :value=>car_item_id)
    end
  end
  
  
  def checkbox_bootstrap_tag(collection, item_name)
    input_id = "car_input3_" + item_name + "_id"
    input_name = "car[input3_" + item_name + "_id]"
    
    content_tag :div, :class=>"btn-group", "data-toggle"=>"buttons-checkbox" do
      engines_html = collection.map do |e|
          content_tag :button, 
            :type => :button,
            :data => {:toggle => input_id},
            :value => e.id,
            :class => "btn btn-primary add_checkbox_value" do
              e.name       
          end
        end
      safe_join(engines_html) +
        tag(:input, :type => :hidden, :id=>input_id, :name=>input_name, :value => "")
    end
  end
end
