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
    expect(response).toBe('Whatever')
  });


});

