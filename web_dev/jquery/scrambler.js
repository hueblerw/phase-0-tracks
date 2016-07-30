console.log("This thing is working!!!");


// Ok what we need is a thing that if we click on it swaps the two adjacent pictures.
// Cat's swap horizontally.
// Dog's swamp vertically.
// If we double-click the cat and dog pictures change.

// <script src="C:/Program Files (x86)/ASUS/Giftbox/node_modules/jquery/src/jquery.js"></script>


$(document).ready(function() {
	$('#upperleft').on('click', function() {
		(this).slideToggle(500);
	});
});