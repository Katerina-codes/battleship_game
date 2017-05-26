require 'game'

describe Game do

  it "Displays the grid and letter to the player" do
    output = StringIO.new
    display = Display.new(output)
    grid = Grid.new
    game = Game.new(grid, display)
    game.show_grid(1)
    expect(output.string).to include(" A ", ".")
  end

end
