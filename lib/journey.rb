require_relative 'oystercard'

class Journey
  attr_reader :entry, :exit

  def initialize(entry_station, exit_station)
    @entry = entry_station
    @exit = exit_station
  end

end
