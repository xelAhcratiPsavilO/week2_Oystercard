class Oystercard

  MAX_BALANCE = 90
  MIN_FARE = 1
  attr_reader :balance

  def initialize(balance: 0)
    @balance = balance
    @in_journey = false
  end

  def topup(amount)
    fail "You can't top up as it exceeds the limit" if @balance + amount > MAX_BALANCE
    @balance += amount
  end

  def deduct(fare)
    @balance -= fare
  end

  def touch_in
    raise "Insufficient funds" if @balance < MIN_FARE
    @in_journey = true
  end

  def touch_out
    @in_journey = false
  end

  def in_journey?
    @in_journey
  end

end
