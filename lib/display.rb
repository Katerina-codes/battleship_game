require_relative 'grid'

class Display

  def initialize(output = $stdout)
    @output = output
  end

  def display_grid(number)
    grid = Grid.new

    letters = grid.get_letters(number)
    grid = grid.draw_grid(number)
    @output.puts letters
    @output.print grid
  end

end
