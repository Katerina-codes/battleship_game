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
    number_to_array_position = {
      1 => 0,
      2 => 1,
      3 => 2,
      4 => 3,
      5 => 4,
      6 => 5,
      7 => 6,
      8 => 7,
      9 => 8,
      10 => 9
    }
    number_to_array_position[number]
  end

  def letter_to_array_position(letter)
    letter_to_array_position = {
      "a" => 0,
      "b" => 1,
      "c" => 2,
      "d" => 3,
      "e" => 4,
      "f" => 5,
      "g" => 6,
      "h" => 7,
      "i" => 8,
      "j" => 9
    }
    letter_to_array_position[letter]
  end

end
