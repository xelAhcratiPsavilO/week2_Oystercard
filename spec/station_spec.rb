require 'station'

describe Station do

  subject(:station) { described_class.new(:name, :zone)}

  context "Providing the initialized station details (name, zone)" do

    describe "#name" do
      it "displays the name of the station" do
        expect(station.name).to eq :name
      end
    end

    describe "#zone" do
      it "displays the number of the zone" do
        expect(station.zone).to eq :zone
      end
    end

  end

end
