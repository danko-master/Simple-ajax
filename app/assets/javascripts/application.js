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
//= require_tree .


$(document).ready(function(){
    
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
        var select = $( "#minbeds" );

        if (select.attr("value") == '') {
        		select.val( new Date().getFullYear() - 3)
        	}
        
        var slider = $( "<div id='slider'></div>" ).insertAfter( select ).slider({
            min: 1970,
            max: new Date().getFullYear(),
            animate: 'fast',
            //step: 50,
            range: "min",
            value: select.attr("value"),
            //value: select.value,
            slide: function( event, ui ) {
            	$( "#minbeds" ).val( ui.value );
            	$( ".ui-slider-handle" ).text(ui.value);
                //select.value = ui.value;
                //alert($( "#minbeds" ).value);
               // alert(ui.value);
            }
        });       
        
        $( ".ui-slider-handle" ).ready(function() {
        	$(".ui-slider-handle").css({width: "33px", 'font-size': "12px"});
        	$( ".ui-slider-handle" ).removeClass('ui-corner-all');
        	$( ".ui-slider-handle" ).text(select.attr("value"));
        })
        
        
        $( "#minbeds" ).change(function() {
            slider.slider( "value", this.value );   
            $( ".ui-slider-handle" ).text(this.value);         
        });
        
        

        
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

    $(window).bind("popstate", function() {
       $.getScript(location.href);
     });
  });
}
  

//$(".load_validate").live("click", function(){
   //$(this).after("<p>Another paragraph!</p>");
//});

