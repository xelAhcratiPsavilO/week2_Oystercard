require 'journey.rb'

describe Journey do
  subject(:journey) {described_class.new(:entry_station, :exit_station)}
  let(:fake_station1) {double :Station}
  let(:fake_station2) {double :Station}

  describe '#start' do
    it 'starts the journey by returning the entry station' do
      expect(journey.entry_station).to eq :entry_station
    end
  end
end
