require 'journey'

describe Journey do
  subject(:journey) {described_class.new(:fake_station)}
  let(:fake_station) {double :Station}

  context 'Given an entry station'do
    it 'has an entry station recorded' do
      expect(journey.entry_station).to eq :fake_station
    end
    it 'does not have an exit station recorded' do
      expect(journey.exit_station).to eq nil
    end


  end

  context 'Given an exit station' do
    it 'has an exit station recorded' do
      journey.finish(:fake_station)
      expect(journey.exit_station).to eq :fake_station
    end

    it 'does not have an entry station recorded' do
      journey.finish(:fake_station)
      expect(journey.entry_station).to eq nil
    end

    describe '#finish' do
      it 'finishes the journey by returning the exit station' do
        expect(journey.finish(:fake_station)).to eq :fake_station
      end
    end

    describe '#complete?' do

      it 'is an incomplete journey' do
        expect(journey.complete?).to be false
      end

      it 'is a complete journey' do
        journey.finish(:fake_station)
        expect(journey.complete?).to be true
      end
    end

  end
end
