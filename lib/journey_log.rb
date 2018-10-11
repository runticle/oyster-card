# frozen_string_literal: true

require_relative 'oystercard'

class JourneyLog
  attr_reader :current_journey, :logged_journies
  def initialize
    @current_journey = Journey.new
    @logged_journies = []
  end

  def start(entry_station)
    @current_journey.entry = entry_station
    @logged_journies << @current_journey
  end

  def finish(exit_station)
    @logged_journies << @current_journey if @current_journey.entry.nil?
    @logged_journies.last.exit = exit_station
    @current_journey = Journey.new
  end
end
