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
      (@exit_station.zone - @entry_station.zone).abs + MINIMUM_FARE
  end

  def fare
    illegal_journey? ? PENALTY_FARE : journey_fare
  end

  def illegal_journey?
    true if @entry_station.nil? || @exit_station.nil?
  end

end
