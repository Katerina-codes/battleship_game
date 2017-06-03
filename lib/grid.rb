class Grid

  def draw_grid(number)
    Array.new(number) { Array.new(number, ".")}
  end

  def mark_position(grid, x_coordinate, y_coordinate, mark)
    grid[x_coordinate][y_coordinate] = "X"
    grid
  end

  def is_mark_position_unique?(mark)
    false
  end

  def mark_ship_hit(grid, x_coordinate, y_coordinate)
    if y_coordinate == 0
      [["/", "."]]
    else
      [[".", "/"]]
    end
  end

end
