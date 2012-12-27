// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require jquery.ui.slider
//= require bootstrap-modal
//= require bootstrap-tab
//= require bootstrap-button
//= require_tree .



$(document).ready(function(){
	
	$('.format_long_nums').each(function(){
        $(this).text($(this).text().replace(/(\d{1,3})(?=(?:\d{3})+$)/g, '$1 '))
    })
    
        
    
    $('.add_checkbox_value').click(function(){
    	
    	val = ""
    	flag = false
    	    	    	   	
    	input_id = $(this).data('toggle')    	
        input_id_str = "#" + input_id + ""
        
        current_val = $(input_id_str).val();    	
    	current_val_arr = current_val.split(';');  
    	
    	sel_val = $(this).val();
    	sel_val_str = sel_val+";"
    	//val += sel_val + ";"
    	
    	for (var i=0,len=current_val_arr.length;i<len;i++) {
    		if(current_val_arr[i] == sel_val)
    		{
    			flag = true;
    		}          
        }                   
    	
    	   	
        
        div_parent = $(this).parent();       
        
        div_parent.children(".active").each(function(){
        	val += $(this).val() + ";"
        })
        
        
        if(flag){
    		val = current_val.replace(sel_val_str, "");
    	}
    	else{
    		val += sel_val + ";"
    	}
                
           	
    	$(input_id_str).val(val);
    })

   
	
    $("#commentForm2").validate({
    	highlight: function(label) {
	    	$(label).closest('.control-group').addClass('error');
	    },
	    success: function(label) {
	    	label
	    		.text('OK!').addClass('valid')
	    		.closest('.control-group').addClass('success');
	    }
    });

    $('#num2').bind('blur input change keyup', autoFill2);
    
    
    
      
  function autoFill2(){
     val = this.value;
     val = val.replace(/[^\d,]/g, '');
     val = val.replace(/\s/g,"");
       
     res = val.replace(/(\s)+/g, '').replace(/(\d{1,3})(?=(?:\d{3})+$)/g, '$1 ');
     this.value = res;
  } 
  
  
  
  
  $(function() {
  	
  	
  	/**** bootstrap radio http://dan.doezema.com/2012/03/twitter-bootstrap-radio-button-form-inputs/ *****/
  	

  	/**** slider ****/
        var select = $( "#car_name" );

        if (select.attr("value") == '') {
        		select.val( new Date().getFullYear() - 3)
        	}
        
        var slider = $( "#slider" ).slider({
            min: 1970,
            max: new Date().getFullYear(),
            animate: 'fast',
            //step: 50,
            range: "min",
            value: select.attr("value"),
            //value: select.value,
            slide: function( event, ui ) {
            	$( "#car_name" ).val( ui.value );
            	$( ".ui-slider-handle" ).text(ui.value);
                //select.value = ui.value;
                //alert($( "#minbeds" ).value);
               // alert(ui.value);
            }
        });       
        
        $( ".ui-slider-handle" ).ready(function() {
        	$( ".ui-slider-handle" ).removeClass('ui-corner-all');
        	$( ".ui-slider-handle" ).text(select.attr("value"));
        })
        
        
        $( "#car_name" ).change(function() {
            slider.slider( "value", this.value );   
            $( ".ui-slider-handle" ).text(this.value);         
        }); 
        
   /*** slider end ***/
        
    });
    
    
    $("#form_name_phone").validate({
    	debug: true,
     rules: {
        "user[name]": { required: true, minlength: 2  },
        "user[phone_number]": { required: true, minlength: 10, digits: true  }
      },
     messages: {
   	     "user[name]": { required: 'Your username is required!!!_modal',
           minlength: 'The minimum number of characters is 2!!!_modal'
           },
        "user[phone_number]": { required: 'Your phone number is required!_modal',
           minlength: 'The minimum 10 numbers!_modal',
           digits: "Only numbers_modal"
            }
   }
    
    });
    
    
    
    
    $("#form_edit").validate({
    	debug: true,
   rules: {
        "user[email]": { required: true, email: true  }
      },
   messages: {
   	     "user[email]": { required: 'Your email is required!!!',
           email: 'The uncorrect email!!!'
            }
   }
    
    });
    
    
  });
  
  
  
if (history && history.pushState) {
  $(function() {	
     $("#products th a, #products .pagination a").live("click", function(e) {
	   $.getScript(this.href);
	   history.pushState(null, document.title, this.href);
       e.preventDefault();
      });
    
    // сортировка вне таблицы
    $('.div-paginate-top a').live("click", function(e) {
	   $.getScript(this.href);
	   history.pushState(null, document.title, this.href);
       e.preventDefault();
      });
    // конец сортировки с помощью div-a  
    

    $(window).bind("popstate", function() {
       $.getScript(location.href);
     });
  });
}
  

//$(".load_validate").live("click", function(){
   //$(this).after("<p>Another paragraph!</p>");
//});

