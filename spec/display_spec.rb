require 'display'
require 'converter'
require 'grid'

describe Display do
  let(:output) { StringIO.new }
  let(:display) { Display.new(output) }
  let(:converter) { Converter.new }

  it "displays grid of 1 by 1 with letter A" do
    grid = Grid.new
    display.display_grid(1, grid, converter)
    expect(output.string).to include(" A ", ".")
  end

  it "Asks the player for a number coordinate" do
    display.ask_for_number
    expect(output.string).to include("Time to make a move. Please enter a number from 1 - 10\n")
  end

  it "Asks the player for a letter" do
    display.ask_for_letter
    expect(output.string).to eq("Please enter a letter from A - J\n")
  end

  it "displays the newest version of the grid" do
    display.display_lastest_grid([["X"]], 1, converter)
    expect(output.string).to include("A", "X")
  end

  it "displays 'This move has been entered before, enter another one!'" do
    display.display_repeated_move_error
    expect(output.string).to eq("This move has been entered before, enter another one!\n")
  end

  it "displays 'Please place your ships in preparation for battle'" do
    display.display_place_ships_message
    expect(output.string).to eq("Please place your ships in preparation for battle\n")
  end

    it "gets a number from a player" do
      input = StringIO.new("1")
      display = Display.new(output, input)
      expect(display.get_number_coordinate).to eq("1")
    end

    it "gets a letter from a player" do
      input = StringIO.new("A")
      display = Display.new(output, input)
      expect(display.get_letter_coordinate).to eq("a")
    end

    it "gets 1 unique coordinate" do
      input = StringIO.new("1\na")
      display = Display.new(output, input)
      expect(display.get_ships_coordinates(1, converter)).to eq([[0, 0]])
    end

    it "displays error message if coordinate is repeated" do
      input = StringIO.new("1\na\n1\na\n1\nb\n")
      display = Display.new(output, input)
      display.get_ships_coordinates(2, converter)
      expect(output.string).to include("You have entered this coordinate already\n")
    end

end
