require 'journey'

describe Journey do
  #subject(:journey) {described_class.new(:fake_station)}
  let(:fake_station1) {double :Station}
  let(:fake_station2) {double :Station}




  context 'Given an entry station'do
    subject(:journey) {described_class.new(:fake_station1)}

      it 'has an entry station recorded' do
        expect(journey.entry_station).to eq :fake_station1
      end
      it 'does not have an exit station recorded' do
        expect(journey.exit_station).to eq nil
      end

      it 'journey is not complete' do
        expect(journey.complete?).to be false
      end
  end

  context 'Given an exit station' do
    subject(:journey) {described_class.new(:fake_station1)}

    it 'has an exit station recorded' do
      journey.finish(:fake_station1)
      expect(journey.exit_station).to eq :fake_station1
    end

    it 'does not have an entry station recorded' do
      journey.finish(:fake_station1)
      expect(journey.entry_station).to eq nil
    end

    it 'checks whether the journey is not complete' do
      expect(journey.complete?).to be false
    end
  end

  context 'Given an entry station and an exit station' do
    subject(:journey) {described_class.new(:fake_station1)}
    before do
      journey.finish(:fake_station2)
    end
    it 'checks whether the journey is complete' do
      expect(journey.complete?).to be true
    end
  end

  context 'No matter the stations, it finishes the journey' do
    subject(:journey) {described_class.new(:fake_station1)}
    describe '#finish' do
      it 'finishes the journey by returning the exit station' do
        expect(journey.finish(:fake_station1)).to eq :fake_station1
      end
    end
  end

end
