require 'computer_player'

describe ComputerPlayer do

  it "returns [0, 0] if passed [0, 0]" do
    computer = ComputerPlayer.new([0, 0])
    expect(computer.play_move(1)).to eq([[0, 0]])
  end
  #
  # it "returns a random move if no move is passed" do
  #   computer = ComputerPlayer.new
  #   expect(computer.play_move(1)).to satisfy { |value_returned| value_returned == [1, 2] }
  # end
  #
  # it "returns 2 coordinates if 2 are needed" do
  #   computer = ComputerPlayer.new
  #   expect(computer.play_move(2)).to eq([[0, 0], [0, 1]])
  # end

end
