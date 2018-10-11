# frozen_string_literal: true

require 'journey'
require 'station'
require 'oystercard'

describe Journey do
  it 'initially has no entry or exit stations' do
    expect(subject.entry).to eq nil
  end
end
