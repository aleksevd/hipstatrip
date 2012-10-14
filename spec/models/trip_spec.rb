require 'spec_helper'

describe Trip do
  it { should have_many :passengers }
  it { should have_many :passengers_trips }
  it { should belong_to :driver }

  describe "#owner" do
    let(:driver) { create(:user) }
    let(:passenger) { create(:user) }

    context "if drivers trip" do
      let(:trip) { create(:trip, driver: driver) }

      it "should be driver" do
        trip.owner.should == driver
      end
    end

    context "passenger trip" do
      let(:trip) { create(:trip) }

      it "should be passanger" do
        trip.passengers_trips.create(passenger_id: passenger.id)

        trip.owner.should == passenger
      end
    end
  end
end
