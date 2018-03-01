# require 'station'
# require 'journey'

class Oystercard

  MAX_BALANCE = 90
  MIN_FARE = 1
  attr_reader :balance, :entry_station, :journey_history

  def initialize(balance = 0)
    @balance = balance
    @entry_station = nil
    @journey_history = []
  end

  def topup(amount)
    fail "You can't top up as it exceeds the limit" if @balance + amount > MAX_BALANCE
    @balance += amount
  end

  def touch_in(station = Station.new)
    raise "Insufficient funds" if @balance < MIN_FARE
    @entry_station = station
  end

  def touch_out(station2 = Station.new)
    deduct(MIN_FARE)
    @journey_history << {:entry_station => @entry_station, :exit_station => station2}
    @entry_station = nil
  end

  def in_journey?
    !@entry_station = nil
  end

  private

  def deduct(fare)
    @balance -= fare
  end

end
