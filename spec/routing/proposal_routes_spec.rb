require "spec_helper"

describe ProposalsController, "routes" do
  it { should route(:get, "/trips/42/proposals/new").to(action: :new, trip_id: 42) }
  it { should route(:post, "/trips/42/proposals").to(action: :create, trip_id: 42) }
end
