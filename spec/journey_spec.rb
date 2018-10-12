# frozen_string_literal: true

require 'journey'
require 'station'
require 'oystercard'
require 'pry'

describe Journey do
  it 'initially has no entry or exit stations' do
    expect(subject.entry_station).to eq nil
  end

  context "calculates correct fare" do
    let (:entry_station) { double :station, zone: 4}
    let (:exit_station) { double :station, zone: 1}
    let (:exit_station_2) { double :station, zone: 4}
    it "should be £4 between zone 1 and 4" do
      subject.entry_station = entry_station
      subject.exit_station = exit_station
      expect(subject.fare).to eq 4
    end
    it "should be £1 between zone 4 and 4" do
      subject.entry_station = entry_station
      subject.exit_station = exit_station_2
      expect(subject.fare).to eq 1
    end
    it "should charge penalty fare if hasnt touchin in" do
      subject.exit_station = exit_station
      expect(subject.fare).to eq Journey::PENALTY_FARE
    end
  end
end
