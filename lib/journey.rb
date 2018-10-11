require_relative 'oystercard'

class Journey
  attr_accessor :entry, :exit

  def initialize
    @entry = nil
    @exit = nil
  end

end
