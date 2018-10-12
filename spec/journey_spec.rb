# frozen_string_literal: true

require 'journey'
require 'station'
require 'oystercard'
require 'pry'

describe Journey do
  it 'initially has no entry or exit stations' do
    expect(subject.entry_station).to eq nil
  end
end
