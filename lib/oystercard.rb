class Oystercard
  attr_reader :balance, :limit
  def initialize(balance: 0)
    @balance = balance
    @limit = 90
  end

  def topup(amount)
    @balance += amount
    amount = 10
    fail "You can't add £#{amount} as it exceeds the limit" if @balance + amount >= limit
  end   	
end  
