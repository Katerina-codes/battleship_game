class ComputerPlayer

  def initialize(moves = (1..10).to_a)
    @moves = moves
  end

  def play_move(number_of_ship_coordinates)
    ship_coordinates = []

    until number_of_ship_coordinates == 0
      move = [@moves.sample, @moves.sample]
      number_of_ship_coordinates -= 1
      ship_coordinates.push(move)
    end
    ship_coordinates
  end

end
