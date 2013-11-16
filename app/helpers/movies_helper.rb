module MoviesHelper
  def format_price(movie)
    if movie.flop?
      content_tag(:strong, "FLOP!")
    else
      number_to_currency(movie.total_gross)
    end
  end
end
