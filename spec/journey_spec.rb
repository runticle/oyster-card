require 'journey'
require 'station'
require 'oystercard'

describe Journey do

  let (:station) { double :station }
  let (:station2) { double :station }
  subject {described_class.new(station, station2)}

  it 'can store entry station' do
    expect(subject.entry).to eq station
  end

  it 'can store exit station' do
    expect(subject.exit).to eq station2
  end

  it 'stores entry and exit station' do
    card = Oystercard.new
    card.topup(10)
    card.touch_in(station)
    card.touch_out(station2)
    expect(card.journeys).to include ({ entry: station, exit: station2 })
  end

  it 'stores multiple entries and exits' do
    card = Oystercard.new
    card.topup(10)
    card.touch_in(station)
    card.touch_out(station)
    card.touch_in(station2)
    card.touch_out(station2)
    expect(card.journeys).to eq([ { entry: station, exit: station },
                                  { entry: station2, exit: station2 } ])
  end
end
