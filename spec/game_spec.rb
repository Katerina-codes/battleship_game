require 'game'

describe Game do
  let(:output) { StringIO.new }
  let(:display) { Display.new(output) }
  let(:grid) { Grid.new }
  let(:move_validator) { MoveValidator.new }
  let(:player_without_input) { Player.new }
  let(:converter) { Converter.new }

  it "Displays the grid and letter to the player" do
    player = player_with_input("1\na")
    game = new_game_instance(player)
    grid_size = 1
    ship_coordinates = [[0, 0]]

    game.game_flow(grid_size, ship_coordinates)

    expect(output.string).to include(" A ", ".")
  end

  it "Updates the grid with a marked position" do
    player = player_with_input("2\nB\b2\na\n1\nb")
    game = new_game_instance(player)
    grid_size = 2
    ship_coordinates = [[0, 1]]

    game.game_flow(grid_size, ship_coordinates)

    expect(output.string).to include("A", "B", "1", "2", ".", ".", "/", "X")
  end

  it "prompts for a letter until it's in the range of A - J" do
    player = player_with_input("K\na")
    game = new_game_instance(player)

    game.only_get_valid_letters

    expect(output.string).to eq("Please enter a letter from A - J\n")
  end

  it "returns the letter if it's inside the range" do
    player = player_with_input("a")
    game = new_game_instance(player)

    expect(game.only_get_valid_letters).to eq("a")
  end

  it "Returns true if move has been played before" do
    game = new_game_instance(player_without_input)

    past_moves = [["1", "a"]]
    move = ["1", "a"]

    expect(game.move_played_before?(move, past_moves)).to eq(true)
  end

  it "Returns false if move hasn't been played before" do
    game = new_game_instance(player_without_input)

    past_moves = [["1", "a"]]
    move = ["1", "b"]

    expect(game.move_played_before?(move, past_moves)).to eq(false)
  end

  it "prompts for a number until it's in the range of 1 - 10" do
    player = player_with_input("11\n3")
    game = new_game_instance(player)

    game.only_get_valid_numbers

    expect(output.string).to eq("Time to make a move. Please enter a number from 1 - 10\n")
  end

  it "returns the number if a valid number is entered" do
    player = player_with_input("1")
    game = new_game_instance(player)

    expect(game.only_get_valid_numbers).to eq("1")
  end

  it "Returns true if move is present in the ship coordinates array" do
    game = new_game_instance(player_without_input)

    expect(game.ship_coordinates([5, 1], [[5, 1]])).to eq(true)
  end

    it "Returns false if move is not present in the ship coordinates array" do
      game = new_game_instance(player_without_input)

      expect(game.ship_coordinates([9, 1],[[9, 2]])).to eq(false)
    end

    it "marks ships and normal positions on the grid" do
      player = player_with_input("1\na\n2\nc\n1\nb")
      game = new_game_instance(player)
      grid_size = 3
      ship_coordinates = [[0, 1], [1, 2]]

      expect(game.game_flow(grid_size, ship_coordinates)).to include(["X", "/", "."], [".", ".", "/"])
    end

    it "does not reset the board if a player enters a move twice" do
      player = player_with_input("1\na\n1\na\n1\nb")
      game = new_game_instance(player)
      grid_size = 2
      ship_coordinates = [[0, 0], [0, 1]]

      expect(game.game_flow(grid_size, ship_coordinates)).to eq([["/", "/"],[".", "."]])
    end

    def player_with_input(player_input)
      input = StringIO.new(player_input)
      Player.new(input)
    end

    def new_game_instance(player)
      Game.new(display, player, grid, move_validator, converter)
    end

end
