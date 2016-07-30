console.log("This thing is working!!!");

// <script src="C:/Program Files (x86)/ASUS/Giftbox/node_modules/jquery/src/jquery.js"></script>

// If we click the cat and dog pictures change to the other animal.

$(document).ready(function() {
	$('img').on('click', function(){
		if ($(this).hasClass('cat')){
			$(this).fadeOut(500)
           		.delay(500)
           		.queue(function(next) { 
           			$(this).attr('src','cute_dog.jpg'); 
           			next(); 
           		})
           		.fadeIn(500); 
           		$(this).removeClass('cat');
           		$(this).addClass('dog');
		} else {
			$(this).fadeOut(500)
           		.delay(500)
           		.queue(function(next) { 
           			$(this).attr('src','cute_cat.jpg'); 
           			next(); 
           		})
           		.fadeIn(500); 
           		$(this).removeClass('dog');
           		$(this).addClass('cat');
		}
	});
});