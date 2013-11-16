require 'spec_helper'

describe "A movie" do
  it "is a flop if the gross revenue is below $50mil" do
    movie = Movie.new(total_gross:9999999)

    expect(movie.flop?).to eq(true)
  end
end


