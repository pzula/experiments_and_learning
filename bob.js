var Bob = function() {
	this.hey = function(input) {

		if (input.search(/[a-zA-Z]/) != -1 && input.toUpperCase() === input) {
			return "Whoa, chill out!";
		} else if (input[input.length - 1] === "?") {
			return "Sure"
		} else if (input.trim() === "") {
      return "Fine. Be that way!";
    } else {
			return "Whatever.";
		}
	}
}

// exports.Bob = Bob; // doesn't work in browsers


// // class methods in JS
// // this is an "object literal"

// DNA  = {
// 	a: 1,
// 	distance: function (strand_one, strand_two) {

// 	}
// }

// DNA.distance("ANAANA", "AGCBABA")