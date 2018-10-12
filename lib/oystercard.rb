# frozen_string_literal: true

require 'pry'
require_relative 'station'
require_relative 'journey_log'
require_relative 'journey'

class Oystercard
  attr_reader :balance, :history

  MINIMUM_BALANCE = 1
  MAXIMUM_BALANCE = 90

  def initialize
    @balance = 0
    @history = JourneyLog.new
  end

  def topup(amount)
    raise "Cannot topup £#{amount}: maximum balance of £#{MAXIMUM_BALANCE}" if (MAXIMUM_BALANCE - @balance) < amount
    @balance += amount
  end

  def touch_in(station)
    raise 'Insufficient funds' if @balance < MINIMUM_BALANCE
    @history.start(station)
  end

  def touch_out(station)
    @history.finish(station)
    deduct(@history.logged_journies.last.fare)
  end

  private

  def deduct(amount)
    @balance -= amount
  end
end
