require 'grid'

describe Grid do

  it "displays 1 box of a grid" do
    grid = Grid.new
    expect(grid.draw_grid).to eq([])
  end
end
