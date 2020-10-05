require './lib/caesar_cipher.rb'

describe '#caesar_cipher' do
  it 'should take a string and shift all characters by an integer amount' do
    expect(caesar_cipher("abcz", 5)).to eql('fghe')
  end
  it "should keep the same character case in the output" do
    expect(caesar_cipher("HELLo", 8)).to eql('PMTTw')
  end
  it "should not change non-alphabetical characters" do
    expect(caesar_cipher("!!!!", 4)).to eql('!!!!')
  end
end