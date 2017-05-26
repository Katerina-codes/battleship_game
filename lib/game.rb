require 'display'

class Game

  def initialize(grid, display)
    @grid = grid
    @display = display
  end

  def show_grid(number)
    @display.display_grid(number)
  end

end
