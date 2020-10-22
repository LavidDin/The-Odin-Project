require 'board'

describe Board do
  
  describe ".initialize" do
    let(:b) {Board.new}
    it "creates a 6 x 7 empty grid" do
      expect(b.grid).to be_a(Array)
      expect(b.grid.length).to eq(6)
      expect(b.grid[0].length).to eq(7)
    end
  end

  describe "#place_mark" do
    let(:b) {Board.new}
    it "places a mark into a position on the board" do
      b.place_mark(0, '○')
      expect do
        (b.grid[6][0]).to eq('○')
      end
    end
  end

  describe "#empty_col?" do
    let(:b) {Board.new}
    it "returns true if the specified column is empty" do
      expect(b.empty_col?(1)).to be true
    end
    it "returns false if the specified column is not empty" do
      6.times { b.place_mark(0, '○') }
      expect(b.empty_col?(0)).to be false
    end
  end

  describe "#empty_board?" do
    let(:empty) {Board.new}
    let(:full) {Board.new}
    it "returns true if there are empty positions on the board" do
      expect(empty.empty_board?).to be true
    end
    it "returns false if there is are no empty positions on the board" do
      (0..6).each {|col| 6.times {full.place_mark(col,'●')} }
      expect(full.empty_board?).to be false
    end
  end

  describe "#win_col?" do
    let(:b) {Board.new}
    it "returns true if the specified player's mark has connected four in any col" do
      6.times { b.place_mark(0, '○') }
      expect(b.win_col?('○')).to be true
    end
    it "returns false if the specified player's mark has not connected four in any col" do
      expect(b.win_col?('●')).to be false
    end
  end

  describe "#win_row?" do
    let(:b) {Board.new}
    it "returns true if the specified player's mark has connected four in any row" do
      (0..3).each {|col| b.place_mark(col, '○') }
      expect(b.win_row?('○')).to be true
    end
    it "returns false if the specified player's mark has not connected four in any row" do
      expect(b.win_row?('●')).to be false
    end
  end

  describe "#win_diagonal?" do
    let(:b) {Board.new}
    it "returns true if the specified player's mark has connected four in any diagonal" do
      b.place_mark(1, '●')
      b.place_mark(2, '●')
      b.place_mark(2, '●')
      b.place_mark(3, '●')
      b.place_mark(3, '●')
      b.place_mark(3, '●')

      b.place_mark(0, '○')
      b.place_mark(1, '○')
      b.place_mark(2, '○')
      b.place_mark(3, '○')
      expect(b.win_diagonal?('○')).to be true
    end
    it "returns false if the specified player's mark has not connected four in any diagonal" do
      expect(b.win_diagonal?('●')).to be false
    end
  end

  describe "#win?" do
    let(:b) {Board.new}
    it "returns true if the player's mark has connected four in a row, diagonal or column" do
      (0..3).each {|col| b.place_mark(col, '○') }
      expect(b.win?('○')).to be true
    end
    it "returns false if the player's mark has not connected four in a row, diagonal or column" do
      expect(b.win?('●')).to be false
    end
  end
end