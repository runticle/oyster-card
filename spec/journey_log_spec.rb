require 'journey_log'
require 'pry'

describe JourneyLog do
  let (:station) { double :station }
  let (:station2) { double :station }
  it 'starts a journey and sets the entry station' do
    subject.start(station)
    expect(subject.current_journey.entry).to eq station
  end
  it 'ends a journey and sets the exit station' do
    subject.start(station)
    subject.finish(station2)
    expect(subject.logged_journies.last.exit).to eq station2
  end
  it 'saves journies in journey log' do
    subject.start(station)
    subject.finish(station)
    expect(subject.logged_journies.length).to eq 1
  end
  it 'saves journies in journey log' do
    subject.start(station)
    subject.finish(station)
    expect(subject.logged_journies.last.entry).to eq station
  end
  it 'starts a different journey when tapped in twice consecutively' do
    subject.start(station)
    subject.start(station2)
    expect(subject.logged_journies.length).to eq 2
  end
  it 'starts a different journey when tapped in twice consecutively' do
    subject.finish(station)
    expect(subject.logged_journies.length).to eq 1
  end
  it 'shows current journey' do
    subject.start(station)
    expect(subject.current_journey.entry).to eq station
  end
end
