class Player

  def initialize(input = $stdin)
    @input = input
  end

  def make_move(move, grid)

    move = grid[0][0]
    p move = "x"
    p grid
    # if grid == [["."]]
    #   [["x"]]
    # else
    #   [["."], ["x"]]
    # end
  end

  def get_number_coordinate
    @input.gets.chomp
  end

  def get_letter_coordinate
    @input.gets.chomp.downcase
  end

end
