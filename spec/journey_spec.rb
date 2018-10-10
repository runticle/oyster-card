require 'journey'
require 'station'
require 'oystercard'

describe Journey do
  it 'stores entry and exit station' do
    card = Oystercard.new
    card.topup(10)
    station1 = Station.new("borough", '1')
    card.touch_in(station1)
    card.touch_out(station1)
    expect(card.journeys).to include ({ entry: station1, exit: station1 })
  end
  
  it 'stores multiple entries and exits' do
    card = Oystercard.new
    card.topup(10)
    station1 = Station.new("borough", '1')
    card.touch_in(station1)
    card.touch_out(station1)
    station2 = Station.new("aldgate", '1')
    card.touch_in(station2)
    card.touch_out(station2)
    expect(card.journeys).to eq([ { entry: station1, exit: station1 },
                                  { entry: station2, exit: station2 } ])
  end
end
