var Hamming = function() {
  this.compute = function(strand1, strand2) {

      if (strand1.length < strand2.length) {
        var smallerStrand = strand1;
      } else {
        var smallerStrand = strand2;
      }

    diffcount = 0;

    for(var i = 0; i < smallerStrand.length; i++) {
      if (strand1[i] != strand2[i]) {
        diffcount += 1;
      }
    }
    return diffcount;
  }
}


exports.Hamming = Hamming;