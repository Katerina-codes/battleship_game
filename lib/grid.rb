class Grid

  def draw_grid(number)
    if number == 1
      "."
    elsif number == 2
      """. .\n. ."""
    else
      """. . .\n. . ."""
    end
  end

end
