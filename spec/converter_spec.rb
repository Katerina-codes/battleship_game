require 'converter'

describe Converter do

    it "draws letter A for grid of 1" do
      expect(subject.number_to_letters(1)).to eq("  A ")
    end

    it "draws letters A, B for grid of 2" do
      expect(subject.number_to_letters(2)).to eq("  A B ")
    end

    it "draws letters A - J for grid of 10" do
      expect(subject.number_to_letters(10)).to eq("  A B C D E F G H I J ")
    end



end
