class Game

  def initialize(grid = Grid.new, display = display.new)
    @grid = grid
    @display = display
  end

  def show_grid
    grid = @grid.draw_grid(10)
    @display.display_grid(grid)
  end

end
