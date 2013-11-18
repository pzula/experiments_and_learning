require "spec_helper"

describe "Viewing an individual movie" do
  it "show's the movies details" do
    movie = Movie.create(movie_attributes)

    visit movie_url(movie)

    expect(page).to have_text(movie.title)
    expect(page).to have_text(movie.rating)
    expect(page).to have_text(movie.description[0..10])
    expect(page).to have_text(movie.released_on)
    expect(page).to have_text("$318,412,101.00")
    expect(page).to have_text(movie.cast)
    expect(page).to have_text(movie.director)
    expect(page).to have_text(movie.duration)
    expect(page).to have_selector("img[src$='#{movie.image_file_name}']")
  end

  it "shows the revenue if the revenue is more than $50mil" do
    movie = Movie.create(movie_attributes(total_gross:55000000.00))

    visit movie_url(movie)

    expect(page).to have_text("$55,000,000.00")
  end

  it "shows movie as a flop if the revenue is less than $50mil" do
    movie = Movie.create(movie_attributes(total_gross:9900000.00))

    visit movie_url(movie)

    expect(page).to have_text("FLOP!")
  end

end
