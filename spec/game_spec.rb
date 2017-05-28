require 'game'

describe Game do

  it "Displays the grid and letter to the player" do
    output = StringIO.new
    display = Display.new(output)
    game = Game.new(display)
    grid_size = 3

    game.game_flow(grid_size)

    expect(output.string).to include(" A ", ".")
  end

end
