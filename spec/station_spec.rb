# frozen_string_literal: true

require 'station'

describe Station do
  station = Station.new('Aldgate', '1')

  it 'returns name of station' do
    expect(station.name).to eq 'Aldgate'
  end

  it 'returns zone of station' do
    expect(station.zone).to eq '1'
  end
end
