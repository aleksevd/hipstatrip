require 'spec_helper'

describe Proposal do
  describe "created from factory" do
    subject { create :proposal }

    it { should be_valid }
    it { should belong_to(:sender) }
    it { should belong_to(:receiver) }
    it { should belong_to(:trip) }

    it { should validate_presence_of(:sender) }
    it { should validate_presence_of(:receiver) }
    it { should validate_presence_of(:trip) }
  end

  describe "#accept!" do
    let(:driver) { create(:user) }
    let(:passenger) { create(:user) }

    context "if owned by Driver" do
      let(:trip) { create(:trip, driver: nil) }
      let!(:proposal1) { create(:proposal, trip: trip, sender: driver) }
      let!(:proposal2) { create(:proposal, trip: trip) }

      specify "proposal state is changed to accepted" do
        expect { proposal1.accept! }.to change { proposal1.state }.to(1)
      end

      specify "driver is assigned to the trip" do
        expect { proposal1.accept! }.to change { trip.driver_id }.to(driver.id)
      end

      specify "all other proposals are destroyed" do
        expect { proposal1.accept! }.to change { Proposal.count }.from(2).to(1)
      end

      specify "seats_occupied should increment by 1" do
        expect { proposal1.accept! }.to change { proposal1.trip.seats_occupied }.from(nil).to(1)
      end

      specify "all other proposals are canceled"
    end

    context "if owned by Passenger" do
      let(:trip) { create(:trip, driver: driver) }
      let(:proposal) { create(:proposal, sender: passenger, receiver: driver, trip: trip) }

      specify "proposal state is changed to accepted" do
        expect { proposal.accept! }.to change { proposal.state }.to(1)
      end

      specify "passenger is added to trip passenger list" do
        trip.passengers.should == []
        proposal.accept!
        trip.reload
        trip.passengers.should == [passenger]
      end

      specify "seats_occupied should increment by 1" do
        expect { proposal.accept! }.to change { proposal.trip.seats_occupied }.from(nil).to(1)
      end
    end
  end

  describe "#cancel!" do
    let(:driver) { create(:user) }
    let(:passenger) { create(:user) }
    let(:trip) { create(:trip, driver: driver) }
    let(:proposal) { create(:proposal, sender: passenger, receiver: driver, trip: trip) }

    it "should decrement trips seats_occupied by 1" do
      proposal.accept!
      expect { proposal.cancel! }.to change { proposal.trip.seats_occupied }.from(1).to(0)
    end
  end
end
