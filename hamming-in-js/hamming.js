var Hamming = function() {
  this.compute = function(strand1, strand2) {

    var smallerStrand = findSmallerStrand(strand1, strand2);

    var diffcount = 0;

    for(var i = 0; i < smallerStrand.length; i++) {
      if (strand1[i] != strand2[i]) {
        diffcount += 1;
      }
    }

    return diffcount;
  }

  function findSmallerStrand(strand1, strand2) {
    if (strand1.length < strand2.length) {
      return strand1;
    } else {
      return strand2;
    }
  }
}

exports.Hamming = Hamming;