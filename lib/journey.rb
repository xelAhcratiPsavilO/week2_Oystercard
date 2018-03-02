require_relative './station.rb'

class Journey
  attr_reader :journey, :entry_station, :exit_station

  def initialize(station_where_I_start_my_journey = nil)
    @entry_station = station_where_I_start_my_journey
    @exit_station = nil
    @journey = {}
  end

  def finish(station_where_I_finish_my_journey)
    @entry_station = nil
    @exit_station = station_where_I_finish_my_journey
  end

  def complete?
    !!@exit_station
  end

end
