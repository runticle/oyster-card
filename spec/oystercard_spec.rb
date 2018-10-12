# frozen_string_literal: true

require 'oystercard'
require 'pry'
require 'station'
require 'journey'
require 'journey_log'

describe Oystercard do
  let(:station) { double :station, zone: 4 }
  let(:station2) { double :station, zone: 1 }
  let(:station3) { double :station, zone: 4 }
  it 'starts with a balance of 0' do
    expect(subject.balance).to eq(0)
  end

  it 'can be topped up' do
    subject.topup(15)
    expect(subject.balance).to eq 15
  end

  it 'cannot store a balance above £90' do
    msg = 'Cannot topup £91: maximum balance of £'
    max_bal = Oystercard::MAXIMUM_BALANCE
    expect { subject.topup(91) }.to raise_error "#{msg}#{max_bal}"
  end

  it 'knows when the user is in transit' do
    subject.topup(10)
    subject.touch_in(station)
    expect(subject).to be_in_journey
  end

  it 'does not allow user to touch in if balance is below minimum' do
    expect { subject.touch_in(station) }.to raise_error 'Insufficient funds'
  end
end
