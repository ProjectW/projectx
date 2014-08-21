if(!Modernizr.touch){ 
    $.stellar();
}

$(document).ready(function(){
	$( ".firstSlide" ).fadeIn( 1000, function() {
    // Animation complete
  	});
 	$('.icon').hover(function() {
      $(this).stop().animate({ fontSize : '9rem' });
	},
	function() {
      $(this).stop().animate({ fontSize : '7rem' });
	});
	
});


