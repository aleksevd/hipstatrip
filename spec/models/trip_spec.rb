require 'spec_helper'

describe Trip do
  it { should have_many :passengers }
  it { should have_many :passengers_trips }
  it { should belong_to :driver }

  describe ".close_to" do
    let!(:trip1) { create(:trip, origin: Point.from_x_y(37.617671, 55.755768, 4326), destination: Point.from_x_y(37.321443, 50.371892, 4326)) }
    let!(:trip2) { create(:trip, origin: Point.from_x_y(37.217671, 55.555768, 4326), destination: Point.from_x_y(37.321443, 50.371892, 4326)) }
    let!(:trip3) { create(:trip, origin: Point.from_x_y(37.617671, 55.755768, 4326), destination: Point.from_x_y(37.121443, 50.171892, 4326)) }
    let!(:trip4) { create(:trip, origin: Point.from_x_y(37.217671, 55.555768, 4326), destination: Point.from_x_y(37.121443, 50.171892, 4326)) }

    let(:probe) { build(:trip, origin: Point.from_x_y(37.517671, 55.655768, 4326), destination: Point.from_x_y(37.421443, 50.471892, 4326)) }

    subject { Trip.close_to(probe) }

    it "should return trips that are in range" do
      should include trip1
    end

    it "should not return trips out of range" do
      should_not include trip2
      should_not include trip3
      should_not include trip4
    end
  end
end
