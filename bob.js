var Bob = function() {
	this.hey = function(input) {

		if (this.isShouting(input)) {
			return "Whoa, chill out!";
		} else if (this.isAQuestion(input)) {
			return "Sure"
		} else if (this.isSilence(input)) {
      return "Fine. Be that way!";
    } else {
			return "Whatever.";
		}
	}

	this.isShouting = function(input) {
		return input.search(/[a-zA-Z]/) != -1 && input.toUpperCase() === input;
	}

	this.isAQuestion = function(input) {
		return input[input.length - 1] === "?";
	}

	this.isSilence = function(input) {
		return input.trim() === "";
	}
}

// exports.Bob = Bob;
// doesn't work in browsers



// // class methods in JS
// // this is an "object literal"

// DNA  = {
// 	a: 1,
// 	distance: function (strand_one, strand_two) {

// 	}
// }

// DNA.distance("ANAANA", "AGCBABA")