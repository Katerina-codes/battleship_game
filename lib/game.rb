require_relative 'display'

class Game

  def initialize(display = Display.new)
    @display = display
  end

  def game_flow(number)
    @display.display_grid(number)
  end

end
