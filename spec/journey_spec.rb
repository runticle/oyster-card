require 'journey'
require 'station'

describe Journey do
  let(:station1) { double :station }
  let(:station2) { double :station }

  it 'stores entry station' do
    subject.entry(station1)
    expect(subject.journey).to include(station1)
  end

  it 'stores exit station' do
    subject.exit(station2)
    expect(subject.journey).to include(station2)
  end

end
