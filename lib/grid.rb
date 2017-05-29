class Grid

  #   A B C
  # 1 . . .
  # 2 . . .
  # 3 . . .

  # C3 -> grid[2][2]

  def draw_grid(number)
    Array.new(number) { Array.new(number, ".")}
  end


  def mark_position(grid, x_coordinate, y_coordinate, mark)
    grid[x_coordinate][y_coordinate] = mark
    grid
  end

end
