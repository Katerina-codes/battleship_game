require 'move_validator'

describe MoveValidator do

  let(:move_validator) {MoveValidator.new}

  it "only allows numbers from 1-10" do
    display = Display.new
    player = Player.new
    move_validator = MoveValidator.new(display, player)
    expect(move_validator.is_number_valid?(1)).to eq(true)
  end

  it "only allows numbers from 1-10" do
    display = Display.new
    player = Player.new
    move_validator = MoveValidator.new(display, player)
    expect(move_validator.is_number_valid?(0)).to eq(false)
  end

  it "Returns true if letter is from a - j" do
    display = Display.new
    player = Player.new
    move_validator = MoveValidator.new(display, player)
    expect(move_validator.is_letter_valid?("a")).to eq(true)
  end

  it "Returns false if letter is k" do
    display = Display.new
    player = Player.new
    move_validator = MoveValidator.new(display, player)
    expect(move_validator.is_letter_valid?("k")).to eq(false)
  end

  it "prompts for a number until it's in the range of 1 - 10" do
    input = StringIO.new("11\n3")
    output = StringIO.new
    player = Player.new(input)
    display = Display.new(output)

    move_validator = MoveValidator.new(display, player)
    move_validator.only_get_valid_numbers

    expect(output.string).to eq("Time to make a move. Please enter a number from 1 - 10\n")
  end

  it "returns the number if a valid number is entered" do
    input = StringIO.new("1")
    output = StringIO.new
    display = Display.new(output)
    player = Player.new(input)

    move_validator = MoveValidator.new(display, player)

    expect(move_validator.only_get_valid_numbers).to eq("1")
  end

end
