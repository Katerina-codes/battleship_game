class Grid

  def draw_grid(number)
    board = Array.new(number) { Array.new(number, ".")}
  end

  def get_letters(number)
    letter_lookup = {
      1 => " A ",
      2 => " A B "
    }
    letter_lookup[number]
  end

end
