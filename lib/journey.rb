require_relative 'station.rb'

class Journey
  attr_reader :journey, :entry_station, :exit_station

  def initialize(x, y)
    @entry_station = x
    @exit_station = y
    @journey = {}
  end


end
