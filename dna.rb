require './nucleotide_validator'

class DNA
  attr_reader :nucleotides 

  def initialize(input)
    if NucleotideValidator.dna?(input)
      @nucleotides = input
    else 
      raise ArgumentError.new("Sorry, U is not a valid nucleotide")
    end

    # unless validate(input)
    #   raise ArgumentError.new("Sorry, #{input} is not a valid nucleotide")
    # end
    # @nucleotides = input
  end


  def count(type)
    if NucleotideValidator.dna_or_rna?(type)
     nucleotides.count(type)
   else
    raise ArgumentError.new("Sorry, #{type} is not a valid nucleotide")
    end
  end

  def nucleotide_counts
    {'A' => count('A'), 
      'T' => count('T'), 
      'C' => count('C'), 
      'G' => count('G')}
  end

end

