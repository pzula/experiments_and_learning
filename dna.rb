class DNA
  attr_reader :nucleotides 

  def initialize(input)
    if input.include?("U") || input.include?("J")
      raise ArgumentError.new("Sorry, U is not a valid nucleotide")
    else 
      @nucleotides = input
    end
  end

  def dna_nucleotides
    ['A', 'T', 'C', 'G']
  end

  def validate(input)
    letters = input.split("")
    letters.all?{|letter| dna_nucleotides.include?(letter)}
  end

  def count(type)
    if type != "X"
     nucleotides.count(type)
   else
    raise ArgumentError.new("Sorry, X is not a valid nucleotide")
    end
  end

  def nucleotide_counts
    {'A' => count('A'), 
      'T' => count('T'), 
      'C' => count('C'), 
      'G' => count('G')}
  end

end