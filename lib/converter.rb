class Converter

  def number_to_letters(number)
    letter_lookup = {
      1 => "  A ",
      2 => "  A B ",
      3 => "  A B C ",
      4 => "  A B C D ",
      5 => "  A B C D E ",
      6 => "  A B C D E F ",
      7 => "  A B C D E F G ",
      8 => "  A B C D E F G H ",
      9 => "  A B C D E F G H I ",
      10 => "  A B C D E F G H I J "
    }
    letter_lookup[number]
  end

  def number_to_array_position(number)
    0
  end

end
