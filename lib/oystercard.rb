class Oystercard
  attr_reader :balance
  def initialize(balance: 0)
    @balance = balance
  end
  def topup(amount)
    @balance += amount
  end   	
end  
