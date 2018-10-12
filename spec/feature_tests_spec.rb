# frozen_string_literal: true

require 'oystercard'
require 'pry'
require 'station'

describe Oystercard do
  context 'Feature tests - ' do
    station3 = Station.new('London Bridge', 1)
    station2 = Station.new('Wimbledon', 3)
    station1 = Station.new('Borough', 1)
    it 'charges a penalty for multiple entries without exit' do
      subject.topup(10)
      subject.touch_in(station1)
      subject.touch_in(station2)
      subject.touch_out(station1)
      expect(subject.balance).to eq 1
    end
    it 'charges a penalty for multiple exits without entry' do
      subject.topup(10)
      subject.touch_in(station1)
      subject.touch_out(station3)
      subject.touch_out(station3)
      expect(subject.balance).to eq 3
    end
    it 'shows the card history' do
      expected = ['Borough to Wimbledon', 'Wimbledon to London Bridge']
      subject.topup(10)
      subject.touch_in(station1)
      subject.touch_out(station2)
      subject.touch_in(station2)
      subject.touch_out(station3)
      expect(subject.list_history).to eq expected
    end
  end
end
