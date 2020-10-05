require './lib/caesar_cipher.rb'

describe "#caesar_cipher" do
  it "shifts the string" do
    expect(caesar_cipher("What a string!", 5)).to eql('Bmfy f xywnsl!')
  end
end