function longestWord(incoming){
	
	// Set the first word as the longest.
	var longest = incoming[0];

	// Then go through each separate word in this new array and if its length is longer than any previous words store it as the longest word.
	for (var i = 1; i < incoming.length; i++){
		if (longest.length < incoming[i].length){
			longest = incoming[i];
		}
	}
	// The last standing word is the longest word.
	return longest;
	// Question would be how to resolve ties.  At present the first word of the longest length will be the output.

}

console.log(longestWord(["long phrase","longest phrase","longer phrase"]));