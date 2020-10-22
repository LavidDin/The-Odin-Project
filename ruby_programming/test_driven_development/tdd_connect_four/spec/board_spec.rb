require 'board'

describe Board do
  b = Board.new
  g = Board.new
  d = Board.new

  describe ".initialize" do
    it "creates a 6 x 7 empty grid" do
      expect(b.grid).to be_a(Array)
      expect(b.grid.length).to eq(6)
      expect(b.grid[0].length).to eq(7)
    end
  end

  describe "#place_mark" do
    it "places a mark into a position on the board" do
      expect do
        b.place_mark(0, '○')
        (b.grid[6][0]).to eq('○')
      end
    end
  end

  describe "#empty_col?" do
    b.place_mark(0, '○')    
    b.place_mark(0, '○')
    b.place_mark(0, '○')
    b.place_mark(0, '○')
    b.place_mark(0, '○')
    b.place_mark(0, '○')
    it "returns true if the specified column is empty" do
      expect(b.empty_col?(1)).to be true
    end
    it "returns false if the specified column is not empty" do
      expect(b.empty_col?(0)).to be false
    end
  end

  describe "#win_col?" do
    it "returns true if the specified player's mark has connected four in any col" do
      expect(b.win_col?('○')).to be true
    end
    it "returns false if the specified player's mark has not connected four in any col" do
      expect(b.win_col?('●')).to be false
    end
  end

  describe "#win_row?" do
    g.place_mark(0, '○')
    g.place_mark(1, '○')
    g.place_mark(2, '○')
    g.place_mark(3, '○')
    it "returns true if the specified player's mark has connected four in any row" do
      expect(g.win_row?('○')).to be true
    end
    it "returns false if the specified player's mark has not connected four in any row" do
      expect(g.win_row?('●')).to be false
    end
  end

  describe "#win_diagonal?" do
    d.place_mark(1, '●')
    d.place_mark(2, '●')
    d.place_mark(2, '●')
    d.place_mark(3, '●')
    d.place_mark(3, '●')
    d.place_mark(3, '●')

    d.place_mark(0, '○')
    d.place_mark(1, '○')
    d.place_mark(2, '○')
    d.place_mark(3, '○')
    it "returns true if the specified player's mark has connected four in any diagonal" do
      expect(d.win_diagonal?('○')).to be true
    end
    it "returns false if the specified player's mark has not connected four in any diagonal" do
      expect(d.win_diagonal?('●')).to be false
    end
  end

=begin
  describe "#win?"
    it "returns false if a row, diagonal or column is filled with player mark" do
      expect(b.win?('O')).to be_false
    end
    it "returns true if a row, diagonal or column is filled with player mark" do
      expect(b.win?('X')).to be_true
    end
  end
=end
end