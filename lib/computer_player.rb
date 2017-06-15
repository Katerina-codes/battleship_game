class ComputerPlayer

  def play_move(number_of_ship_coordinates, grid_size)
    ship_coordinates = []

    until number_of_ship_coordinates == 0
      move = [(0..grid_size - 1).to_a.sample, (0..grid_size - 1).to_a.sample]
      number_of_ship_coordinates -= 1
      ship_coordinates.push(move)
    end
    ship_coordinates
  end

end
