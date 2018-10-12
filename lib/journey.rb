# frozen_string_literal: true

require_relative 'oystercard'

class Journey
  MINIMUM_FARE = 1
  PENALTY_FARE = 6
  attr_accessor :entry_station, :exit_station

  def initialize
    @entry_station
    @exit_station
  end

  def journey_fare
      (@exit_station.zone - @entry_station.zone).abs + 1
  end

  def fare
    in_journey? ? journey_fare : PENALTY_FARE
  end

  def in_journey?
    true unless @entry_station.nil?
  end

end
