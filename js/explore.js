// function reverse that takes a string.
// It takes each letter of the string in reverse starting with the last character and adds it to a blank string.
// It continues this until it reaches the first letter and stops.
function reverse(incoming){
	var output = "";
	for (var i = incoming.length - 1; i >= 0; i--){
		output += incoming[i];
	}
	return output;
}

var greatThought = "Cats like to eat parsley!";
if (greatThought.length > 2){
	console.log(reverse(greatThought));
}
