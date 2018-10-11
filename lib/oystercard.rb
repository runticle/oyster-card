# frozen_string_literal: true

require 'pry'
require_relative 'station'
require_relative 'journey_log'
require_relative 'journey'

class Oystercard
  attr_reader :balance, :start_station, :end_station, :journeys, :history

  MINIMUM_BALANCE = 1
  MAXIMUM_BALANCE = 90
  MINIMUM_FARE = 1
  PENALTY_FARE = 6

  def initialize
    @balance = 0
    @history = JourneyLog.new
  end

  def topup(amount)
    raise "Cannot topup £#{amount}: maximum balance of £#{MAXIMUM_BALANCE}" if (MAXIMUM_BALANCE - @balance) < amount

    @balance += amount
  end

  def touch_in(station)
    penalty if in_journey?
    raise 'Insufficient funds' if @balance < MINIMUM_BALANCE

    @history.start(station)
    @start_station = station
  end

  def touch_out(station)
    @end_station = station
    fare
    @start_station = nil
    @history.finish(station)
  end

  def in_journey?
    true unless @start_station.nil?
  end

  private

  def update_zones
      (@end_station.zone - @start_station.zone).abs + 1
  end

  def fare
    in_journey? ? deduct(update_zones) : penalty
  end

  def penalty
    deduct(PENALTY_FARE)
  end

  def deduct(amount)
    @balance -= amount
  end
end
