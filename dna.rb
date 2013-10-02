class DNA
  attr_reader :nucleotides 

  def initialize(input)
    if validate_dna(input)
      @nucleotides = input
    else 
      raise ArgumentError.new("Sorry, U is not a valid nucleotide")
    end

    # unless validate(input)
    #   raise ArgumentError.new("Sorry, #{input} is not a valid nucleotide")
    # end
    # @nucleotides = input
  end

  def dna_nucleotides
    ['A', 'T', 'C', 'G']
  end

  def all_nucleotides
    dna_nucleotides + ['U']
  end

  def validate_dna(input)
    letters = input.split("")
    letters.all?{|letter| dna_nucleotides.include?(letter)}
  end

  def validate_dna_or_rna(input)
    letters = input.split("")
    letters.all?{|letter| all_nucleotides.include?(letter)}
  end

  def count(type)
    if validate_dna_or_rna(type)
     nucleotides.count(type)
   else
    raise ArgumentError.new("Sorry, #{type} is not a valid nucleotide")
    end
  end

  def nucleotide_counts
    # {'A' => count('A'), 
    #   'T' => count('T'), 
    #   'C' => count('C'), 
    #   'G' => count('G')}

    dna_nucleotides.each_with_object({}) do |nucleotide, result|
      result[nucleotide] = count(nucleotide)
    end
  end

end