require 'grid'

describe Grid do

  it "draws a grid thats 1 by 1" do
    grid = Grid.new
    expect(grid.draw_grid(1)).to eq(["1", "."])
  end

#   it "draws a grid thats 2 by 2" do
#     grid = Grid.new
#     expect(grid.draw_grid(2)).to eq(""". .
# . .""")
#   end
#
#   it "draws a grid thats 3 by 3" do
#     grid = Grid.new
#     expect(grid.draw_grid(3)).to eq(""". . .
# . . .
# . . .""")
#   end

end
