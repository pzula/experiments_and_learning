class DNA
  attr_reader :nucleotides 

  def initialize(input)
    @nucleotides = input
  end

  def count(type)
    nucleotides.count(type)
  end

  def nucleotide_counts
    {'A' => count('A'), 'T' => count('T'), 'C' => count('C'), 'G' => count('G')}
  end

end