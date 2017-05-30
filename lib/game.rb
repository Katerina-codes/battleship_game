require_relative 'display'
require_relative 'player'

class Game

  def initialize(display = Display.new)
    @display = display
  end

  def game_flow(number)
    player = Player.new
    @display.display_grid(number)
    @display.ask_for_number
    player.get_number_coordinate
  end

end
