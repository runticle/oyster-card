# frozen_string_literal: true

require_relative 'oystercard'

class Journey
  attr_accessor :entry, :exit

  def initialize
    @entry
    @exit
  end
end
