require "spec_helper"

describe Proposal::Action do
  let(:proposal) { create(:proposal, id: 42) }
  subject { Proposal::Action.new(proposal_id: proposal.id) }

  it { should be_valid }
  it { should validate_presence_of(:proposal_id) }

  its(:proposal) { should == proposal }
end
