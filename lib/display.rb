class Display

  def initialize(output = $stdout)
    @output = output
  end

  def display_grid(grid)
    @output.print grid
  end

end
