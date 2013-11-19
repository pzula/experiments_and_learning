var Hamming = require('./hamming').Hamming;

describe("DNA Strands", function() {
  var dnaTestStrand = new Hamming();

  it("have no difference between strands" , function() {
    var difference = dnaTestStrand.compute('', '');
    expect(difference).toBe(0);
  });



});