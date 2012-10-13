require "spec_helper"

describe Proposal::Accept do
  let(:proposal) { build(:proposal) }
  let(:accept) { described_class.new }

  before { accept.stub(:proposal).and_return(proposal) }

  specify "#save" do
    proposal.should_receive(:accept!)
    accept.save
  end
end
