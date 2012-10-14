require "spec_helper"

describe Proposal::CancelsController, "routes" do
  it { should route(:post, "/proposals/42/cancel").to(action: :create, proposal_id: 42) }
end
