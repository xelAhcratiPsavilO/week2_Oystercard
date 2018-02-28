require "oystercard.rb"
describe Oystercard do
  describe "#balace" do
    it "shows the amount of money that's left on card" do
      balance = 0
      expect(subject.balance).to eq balance
    end
  end

  describe "#topup" do
    it "allows user to top up" do
      expect{ subject.topup 1 }.to change{ subject.balance }.by 1
    end

    it "raises an error when the amount exceeds the limit" do
      subject.topup(Oystercard::MAX_BALANCE)
      message = "You can't top up as it exceeds the limit"
      expect{ subject.topup 1 }.to raise_error message
    end
  end

  describe '#deduct'do
   it 'deduces the fare for journey' do
     expect{subject.deduct 1 }.to change{ subject.balance }.by -1
   end
 end

 describe '#touch_in' do
   it 'should return journey status as true' do
     subject.topup(Oystercard::MIN_FARE)
     expect(subject.touch_in).to eq true
   end

   it 'raise error if balance is less than min fare' do
     expect{ subject.touch_in }.to raise_error "Insufficient funds"
   end
 end

 describe "#touch_out" do
   it 'should return journey status as false' do
     expect(subject.touch_out).to eq subject.in_journey?
   end

   it 'should reduce balance by MIN_FARE' do
     subject.topup(Oystercard::MIN_FARE)
     subject.touch_in
     expect{ subject.touch_out }.to change{ subject.balance }.by (-Oystercard::MIN_FARE)
   end
 end

 describe '#in_journey' do
   it 'it returns in_journey status' do
     subject.topup(1)
     subject.touch_in
     expect(subject.in_journey?).to eq true
   end
 end
end
