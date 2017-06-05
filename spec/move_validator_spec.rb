require 'move_validator'

describe MoveValidator do

  it "only allows numbers from 1-10" do
    display = Display.new
    player = Player.new
    expect(subject.is_number_valid?(1)).to eq(true)
  end

  it "only allows numbers from 1-10" do
    display = Display.new
    player = Player.new
    expect(subject.is_number_valid?(0)).to eq(false)
  end

  it "Returns true if letter is from a - j" do
    display = Display.new
    player = Player.new
    expect(subject.is_letter_valid?("a")).to eq(true)
  end

  it "Returns false if letter is k" do
    display = Display.new
    player = Player.new
    expect(subject.is_letter_valid?("k")).to eq(false)
  end

end
