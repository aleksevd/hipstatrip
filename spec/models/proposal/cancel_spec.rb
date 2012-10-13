require "spec_helper"

describe Proposal::Cancel do
  let(:proposal) { build(:proposal) }
  let(:cancel) { described_class.new }

  before { cancel.stub(:proposal).and_return(proposal) }

  specify "#save" do
    proposal.should_receive(:cancel!)
    cancel.save
  end
end
