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

    formatted_grid = grid.map do |row|
      row.join(" ") + "\n"
    end

    final_grid = formatted_grid.each_with_index.map do |row, index|
      @output.print index.to_s + " ", row
    end

    def ask_for_move
      @output.puts "Time to make a move. Please enter a number from 1 - 10"
    end

  end

end
