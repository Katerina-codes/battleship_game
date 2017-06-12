class Grid

  def draw_grid(grid_size)
    Array.new(grid_size) { Array.new(grid_size, ".") }
  end

  def mark_position(grid, x_coordinate, y_coordinate, mark)
    grid[x_coordinate][y_coordinate] = mark
    grid
  end

  def is_mark_position_unique?(mark)
    false
  end

  def mark_ship_hit(grid, x_coordinate, y_coordinate)
    grid[x_coordinate][y_coordinate] = "/"
    grid
  end

end
