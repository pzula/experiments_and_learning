var Bob = function() {
	this.hey = function(input) {

		if (input.toUpperCase() === input) {
			return "Whoa, chill out!";
		} else if (input[input.length - 1] === "?") {
			return "Sure"
		} else {
			return "Whatever.";	
		}	
	}
}

exports.Bob = Bob;


// // class methods in JS
// // this is an "object literal"

// DNA  = { 
// 	a: 1,
// 	distance: function (strand_one, strand_two) {

// 	}
// }

// DNA.distance("ANAANA", "AGCBABA")