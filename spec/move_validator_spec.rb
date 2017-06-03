require 'move_validator'

describe MoveValidator do

  let(:move_validator) {MoveValidator.new}

  it "only allows numbers from 1-10" do
    display = Display.new
    player = Player.new
    move_validator = MoveValidator.new
    expect(move_validator.is_number_valid?(1)).to eq(true)
  end

  it "only allows numbers from 1-10" do
    display = Display.new
    player = Player.new
    move_validator = MoveValidator.new
    expect(move_validator.is_number_valid?(0)).to eq(false)
  end

  it "Returns true if letter is from a - j" do
    display = Display.new
    player = Player.new
    move_validator = MoveValidator.new
    expect(move_validator.is_letter_valid?("a")).to eq(true)
  end

  it "Returns false if letter is k" do
    display = Display.new
    player = Player.new
    move_validator = MoveValidator.new
    expect(move_validator.is_letter_valid?("k")).to eq(false)
  end

end
