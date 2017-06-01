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
      @output.print (index + 1).to_s + " ", row
    end
  end

    def ask_for_number
      @output.puts "Time to make a move. Please enter a number from 1 - 10"
    end

    def ask_for_letter
      @output.puts "Please enter a letter from A - J"
    end

    def display_lastest_grid(grid, number)
      converter = Converter.new

      letters = converter.number_to_letters(number)
      @output.puts letters

      formatted_grid = grid.map do |row|
        row.join(" ") + "\n"
      end

      final_grid = formatted_grid.each_with_index.map do |row, index|
        @output.print (index + 1).to_s + " ", row
      end

    end

end
