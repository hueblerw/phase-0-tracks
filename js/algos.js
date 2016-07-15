// RELEASE 0

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

// RELEASE 1

function dualObjectCompare(obj1, obj2){
	// Since both key and value need to match:
	// First compare the keys to see if they match.  If the keys don't match then the "key-value" pair can't match/
	// This requires looping through all combinations to search for a match.  A ?= a, A ?= b ..., then B ?= b, etc. 
	// (Note: since equality is communative I can match a smaller and smaller array each time.)
	// If you find a match set boolean to true and store the matching pair in an array / object.
	var keysMatch = false;
	var matchingPairs = {};
	var keys1 = Object.keys(obj1);
	var keys2 = Object.keys(obj2);
	for (var i = 0; i < keys1.length; i++){
		for (var j = i; j < keys2.length; j++){
			if (keys1[i] == keys2[j]){
				keysMatch = true;
				matchingPairs[i] = j;
			}
		}
	}
	console.log(keysMatch + " / " + matchingPairs);
	// If there is no key match output false.
	// Else check the matching keys values to see if they match.
	var match = false;
	if (keysMatch = true){
		var pairs = Object.keys(matchingPairs);
		for (var k = 0; k < pairs.length; k++){
			if (obj1[pairs[k]] == obj2[matchingPairs[k]]){
				match = true;
			}
		}
	}
	return match;
	
}

// DRIVER CODE RELEASE 0

console.log(longestWord(["long phrase","longest phrase","longer phrase"]));
console.log(longestWord(["Banana", "Orange", "Apple", "Mango"]));

// DRIVER CODE RELEASE 1

console.log(dualObjectCompare({name: "Steven", age: 54}, {name: "Tamir", age: 54}));