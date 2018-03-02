require 'oystercard'

describe Oystercard do
  let(:station1) { double :station1 }
  let(:station2) { double :station2 }

  describe "#balance" do
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
     allow_any_instance_of(Oystercard).to receive(:deduct) do
       expect{subject.deduct 1 }.to change{ subject.balance }.by -1
     end
   end
 end

 describe '#touch_in' do

   it 'raise error if balance is less than min fare' do
     expect{ subject.touch_in(:station1) }.to raise_error "Insufficient funds"
   end

   it 'remembers entry station after touch in' do
     subject.topup(Oystercard::MIN_FARE)
     subject.touch_in(:station1)
     expect(subject.entry_station).to eq :station1
   end

  describe '#in_journey' do
    it 'it returns in_journey status and expects you to be in journey' do
      subject.topup(1)
      subject.touch_in(:station1)
      expect(subject.in_journey?).to eq true
    end
  end

 end

 describe "#touch_out" do

  before(:each) do
    subject.topup(Oystercard::MIN_FARE)
    subject.touch_in(:station1)
  end

   it 'should reduce balance by MIN_FARE' do
     expect{ subject.touch_out(:station2) }.to change{ subject.balance }.by (-Oystercard::MIN_FARE)
   end

   it 'should set entry_station to nil' do
     subject.touch_out(:station2)
     expect(subject.entry_station).to eq nil
   end

   it 'keeps track of one full journey journey' do
     subject.touch_out(:station2)
     expect(subject.journey_history).to eq [{entry_station: :station1, exit_station: :station2}]
   end

   it 'keeps track of the exit station' do
     expect(subject.touch_out(:station2)).to eq :station2
   end

   it 'remembers exit station after touch out' do
     subject.touch_out(:station2)
     expect(subject.exit_station).to eq :station2
   end

   describe '#in_journey' do
     it 'it returns in_journey status and expects you not to be in journey' do
       subject.topup(1)
       subject.touch_in(:station1)
       subject.touch_out(:station2)
       expect(subject.in_journey?).to eq false
     end
   end

 end

end
