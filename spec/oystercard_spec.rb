require 'oystercard'

describe Oystercard do

  it "starts with a balance of 0" do
    oyster = Oystercard.new
    expect(oyster.balance).to eq(0)
  end

  it 'can be topped up' do
    oyster = Oystercard.new
    oyster.topup(15)
    expect(oyster.balance).to eq 15
  end
end