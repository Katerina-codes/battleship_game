require 'game'

describe Game do

  it "Displays the grid and letter to the player" do
    output = StringIO.new
    display = Display.new(output)
    player = Player.new
    grid = Grid.new
    game = Game.new(display, player, grid)
    grid_size = 3

    game.game_flow(grid_size)

    expect(output.string).to include(" A ", ".")
  end

  it "Updates the grid with a marked position" do
    input = StringIO.new("2\nB\n2\nB\b2\nB")
    output = StringIO.new
    display = Display.new(output)
    player = Player.new(input)
    grid = Grid.new
    game = Game.new(display, player, grid)
    grid_size = 2

    game.game_flow(grid_size)

    expect(output.string).to include("A", "B", "1", "2", ".", ".", ".", "X")
  end

end
