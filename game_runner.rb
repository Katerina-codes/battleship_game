require_relative 'lib/game'
require_relative 'lib/display'
require_relative 'lib/grid'

new_game = Game.new(Display.new, Player.new, Grid.new)
new_game.game_flow(10)
