class Grid

  def draw_grid(number)
    Array.new(number) { Array.new(number, ".")}
  end

  def mark_position(grid, x_coordinate, y_coordinate, mark)
    grid[x_coordinate][y_coordinate] = mark
    grid
  end

end
