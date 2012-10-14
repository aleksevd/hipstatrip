require "spec_helper"

describe Proposal::AcceptsController, "routes" do
  it { should route(:post, "/proposals/42/accept").to(action: :create, proposal_id: 42) }
end
