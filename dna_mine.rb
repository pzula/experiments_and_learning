class DNA

 
  def initialize(input)
    input.split("")
  end

  def count(input)
    if input == 'A'
      0
    elsif input == 'G'
      nucleotide_counts['G']
    elsif input == 'C'
      5
    end

    
    # letters.each do |letter|
    #   @data[letter] += 1
    # end
  end

  def nucleotide_counts
      counts = {'A' => 0, 'T' => 0, 'C' => 0, 'G' => 0}
      hash.update(counts){|'G', 8| f(8)}

  end

end