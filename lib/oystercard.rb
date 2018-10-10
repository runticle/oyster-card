require 'pry'
require_relative 'station'

class Oystercard

  attr_reader :balance, :start_station, :end_station, :journeys

  MINIMUM_BALANCE = 1
  MAXIMUM_BALANCE = 90
  MINIMUM_FARE = 1
  PENALTY_FARE = 6

  def initialize
    @balance = 0
    @journeys = []
  end

  def topup(amount)
    raise "Cannot topup £#{amount}: maximum balance of £#{MAXIMUM_BALANCE}" if (MAXIMUM_BALANCE - @balance) < amount
    @balance += amount
  end

  def touch_in(station)
    penalty if in_journey?
    raise 'Insufficient funds' if @balance < MINIMUM_BALANCE
    @start_station = station
  end

  def touch_out(station)
    @end_station = station
    record_journey && fare
    @start_station = nil
  end

  def record_journey
    @journeys << {entry: start_station, exit: end_station}
  end

  def in_journey?
    true if @start_station != nil
  end

  private

  def fare
    in_journey? ? deduct(MINIMUM_FARE) : penalty
  end

  def penalty
    deduct(PENALTY_FARE)
  end

  def deduct(amount)
    @balance -= amount
  end

end
