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

module NucleotideValidator

  def self.dna?(input)
    letters = input.split("")
    letters.all?{|letter| dna_nucleotides.include?(letter)}
  end

  def self.rna?(input)
    letters = input.split("")
    letters.all?{|letter| all_nucleotides.include?(letter)}
  end

  def self.dna_nucleotides
    ['A', 'T', 'C', 'G']
  end

  def self.all_nucleotides
    dna_nucleotides + ['U']
  end

  def self.validate_dna(input)
    letters = input.split("")
    letters.all?{|letter| dna_nucleotides.include?(letter)}
  end

  def self.dna_or_rna?(input)
    letters = input.split("")
    letters.all?{|letter| all_nucleotides.include?(letter)}
  end

end