require "oystercard.rb"
describe Oystercard do
  context "money" do	
    it "shows the amount of money that's left on card" do
      balance = 0
      oystercard = Oystercard.new
      expect(oystercard.balance).to eq balance
    end
    it "allows user to top up" do	
      oystercard = Oystercard.new
      amount = 100
      expect{ oystercard.topup(amount) }.to change{ oystercard.balance }.by (amount)
    end  	
  end 
end