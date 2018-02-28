# require 'station'
# require 'journey'

class Oystercard

  MAX_BALANCE = 90
  MIN_FARE = 1
  attr_reader :balance
  attr_reader :entry_station

  def initialize(balance = 0)
    @balance = balance
    @in_journey = false
    @entry_station = nil
  end

  def topup(amount)
    fail "You can't top up as it exceeds the limit" if @balance + amount > MAX_BALANCE
    @balance += amount
  end

  def touch_in(station = Station.new)
    raise "Insufficient funds" if @balance < MIN_FARE
    @entry_station = station
    @in_journey = true
  end

  def touch_out
    deduct(MIN_FARE)
    @in_journey = false
  end

  def in_journey?
    @in_journey
  end

  private

  def deduct(fare)
    @balance -= fare
  end

end
