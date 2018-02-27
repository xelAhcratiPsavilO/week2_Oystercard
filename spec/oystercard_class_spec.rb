require "oystercard.rb"
describe Oystercard do
  describe "#balace" do	
    it "shows the amount of money that's left on card" do
      balance = 0
      oystercard = Oystercard.new
      expect(oystercard.balance).to eq balance
    end
  end
   
  describe "#topup" do  
    it "allows user to top up" do	
      oystercard = Oystercard.new
      amount = 10
      expect{ oystercard.topup(amount) }.to change{ oystercard.balance }.by (amount)
    end  

    it "raises an error when the amount exceeds the limit" do
      oystercard = Oystercard.new	
      amount = 10
      message = "You can't add £#{amount} as it exceeds the limit"
      expect{ oystercard.topup(oystercard.limit + amount) }.to raise_error message	
    end
  end 
end