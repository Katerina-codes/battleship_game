require_relative 'display'

class Game

  def initialize(display = Display.new)
    # @grid = grid
    @display = display
  end

  def game_flow
    number = 10
    @display.display_grid(number)
  end

end
