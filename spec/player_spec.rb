require 'player'

describe Player do

  it "gets a number from a player" do
    input = StringIO.new("1")
    player = Player.new(input)
    expect(player.get_number_coordinate).to eq("1")
  end

  it "only allows numbers from 1-10" do
    player = Player.new
    expect(player.is_number_valid?(1)).to eq(true)
  end

  it "only allows numbers from 1-10" do
    player = Player.new
    expect(player.is_number_valid?(0)).to eq(false)
  end

  it "gets a letter from a player" do
    input = StringIO.new("A")
    player = Player.new(input)
    expect(player.get_letter_coordinate).to eq("a")
  end

end
