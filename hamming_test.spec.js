var Hamming = require('./hamming').Hamming;

describe("DNA Strands", function() {
  var dnaTestStrand = new Hamming();

  it("have no difference between strands" , function() {
    var difference = dnaTestStrand["compute"]('', '');
    expect(difference).toBe(0);
  });

  it("have no difference between identical strands", function() {
    var difference = dnaTestStrand.compute('GGACTGA', 'GGACTGA');
    expect(difference).toBe(0);
  });

  it("properly compute distance in a small strand", function() {
    var difference = dnaTestStrand.compute('ACT', 'GGA');
    expect(difference).toBe(3);
  });

  it("properly compute distance in an off-by-one strand", function() {
    var difference = dnaTestStrand.compute('GGACGGATTCTG', 'AGGACGGATTCT');
    expect(difference).toBe(9);
  });

  it("properly compute distance in the middle somewhere", function() {
    var difference = dnaTestStrand.compute('GGACG', 'GGTCG');
    expect(difference).toBe(1);
  });

  it("properly compute larger distance", function() {
    var difference = dnaTestStrand.compute('ACCAGGG', 'ACTATGG');
    expect(difference).toBe(2);
  });

  it("properly ignores extra length on second strand when computing", function() {
    var difference = dnaTestStrand.compute('AAACTAGGGG', 'AGGCTAGCGGTAGGAC');
    expect(difference).toBe(3);
  });

  it("properly ignores extra length on original strand when longer", function() {
    var difference = dnaTestStrand.compute('GACTACGGACAGGGTAGGGAAT', 'GACATCGCACACC');
    expect(difference).toBe(5);
  });


});