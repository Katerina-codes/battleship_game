require 'computer_player'

describe ComputerPlayer do

  it "returns a move when it is passed a move" do
    computer = ComputerPlayer.new
    expect(computer.play_move).to eq("1b")
  end
end
