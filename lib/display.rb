require_relative 'grid'
require_relative 'converter'

class Display

  def initialize(output = $stdout)
    @output = output
  end

  def display_grid(number)
    grid = Grid.new
    converter = Converter.new

    letters = converter.number_to_letters(number)
    grid = grid.draw_grid(number)
    @output.puts letters
    @output.print grid
  end

end
