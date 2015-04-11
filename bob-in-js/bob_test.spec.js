var Bob = require('./bob').Bob;

describe("Teenager Response", function() {
	var teenager = new Bob();

  it("is Whatever when stating something", function() {
   var response = teenager.hey('Tom-ay-to, tom-ahhh-to.');
   expect(response).toBe('Whatever.');
 });

  it("is Chill Out when shouting", function() {
  	var response = teenager.hey('WATCH OUT!');
  	expect(response).toBe('Whoa, chill out!');
  });

  it("is Sure whenever asked a question", function() {
  	var response = teenager.hey('Does this cryogenic chamber make me look fat?');
  	expect(response).toBe('Sure');
  });

  it("is Sure even if asking a numberic question", function() {
  	var response = teenager.hey('You are, what, like 15?');
  	expect(response).toBe('Sure');
  });

  it("is Whatever even when something is said forcefully", function() {
  	var response = teenager.hey("Let's go make out behind the gym!");
  	expect(response).toBe('Whatever.')
  });

  it("is Whatever when using an acronmyn in regular speech", function() {
    var response = teenager.hey("It's OK if you don't want to go to the DMV.");
    expect(response).toBe('Whatever.')
  });

  it("is Whoa chill out when asked a forceful question", function() {
    var response = teenager.hey("WHAT THE HELL WERE YOU THINKING?");
    expect(response).toBe("Whoa, chill out!")
  });

  it("is Whoa chill out when shouting numbers", function() {
    var response = teenager.hey("1, 2, 3 GO!");
    expect(response).toBe("Whoa, chill out!");
  });

  it("is Whatever when you say numbers", function() {
    var response = teenager.hey("1, 2, 3");
    expect(response).toBe("Whatever.");
  });

  it("is Sure when a question is Numbers only", function() {
    var response = teenager.hey("4?");
    expect(response).toBe("Sure");
  });

  it("is Whoa Chill Out when shouting with special characters", function() {
    var response = teenager.hey("ZOMG THE %^*@#$(*^ ZOMBIES ARE COMING!!11!!1!");
    expect(response).toBe("Whoa, chill out!");
  });

  it("is Who Chill Out when shouting with no exclaimation point", function() {
    var response = teenager.hey("I HATE YOU");
    expect(response).toBe("Whoa, chill out!")
  });

  it("is Whatever if a question mark is in the middle of the statement", function() {
    var response = teenager.hey("Ending with ? means a question.");
    expect(response).toBe("Whatever.");
  });

  it("is Sure when asked another question", function() {
    var response = teenager.hey("Wait! Hang on. Are you going to be OK?");
    expect(response).toBe("Sure");
  });

  it("returns Fine Be That Way when presented with silence", function() {
    var response = teenager.hey("");
    expect(response).toBe("Fine. Be that way!");
  });

  it("returns Fine Be That Way when presented with prolonged silence", function() {
    var response = teenager.hey("     ");
    expect(response).toBe("Fine. Be that way!");
  });


});

