require 'display'

describe Display do

  it "displays grid of 1 by 1" do
    output = StringIO.new
    display = Display.new(output)
    display.display_grid(".")
    expect(output.string).to eq(".")
  end

end
