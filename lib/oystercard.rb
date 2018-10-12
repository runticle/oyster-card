# frozen_string_literal: true

require 'pry'
require_relative 'station'
require_relative 'journey_log'
require_relative 'journey'

class Oystercard
  attr_reader :balance, :history, :entry_station

  MINIMUM_BALANCE = 1
  MAXIMUM_BALANCE = 90
  PENALTY_FARE = 6

  def initialize
    @balance = 0
    @history = JourneyLog.new
  end

  def topup(amount)
    msg = "Cannot topup £#{amount}: maximum balance of £#{MAXIMUM_BALANCE}"
    raise msg if (MAXIMUM_BALANCE - @balance) < amount

    @balance += amount
  end

  def touch_in(station)
    @entry_station = station
    check_last
    raise 'Insufficient funds' if @balance < MINIMUM_BALANCE

    @history.start(station)
  end

  def touch_out(station)
    @history.finish(station)
    deduct(@history.logged_journies.last.fare)
    @entry_station = nil
  end

  def in_journey?
    true unless @entry_station.nil?
  end

  def list_history
    @history.logged_journies.map do |trip|
      "#{trip.entry_station.name} to #{trip.exit_station.name}"
    end
  end

  private

  def check_last
    unless @history.logged_journies.last.nil?
      deduct(PENALTY_FARE) if @history.logged_journies.last.exit_station.nil?
    end
  end

  def deduct(amount)
    @balance -= amount
  end
end
