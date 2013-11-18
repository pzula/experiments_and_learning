module MoviesHelper
  def format_price(movie)
    if movie.flop?
      content_tag(:strong, "FLOP!")
    else
      number_to_currency(movie.total_gross)
    end
  end

  def image_for(movie)
    if movie.image_file_name.blank?
      image_tag 'placeholder.jpg'
    else
      image_tag movie.image_file_name
    end
  end
end
