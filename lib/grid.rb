class Grid

  def draw_grid(number)
    board = Array.new(number) { Array.new(number, ".")}
  end

  def get_letters(number)
    if number == 1
      " A "
    else
      " A B "
    end
  end

end
