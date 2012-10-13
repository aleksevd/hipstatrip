require "spec_helper"

describe Proposal::CancelsController do
  describe "POST create" do
    let(:cancel) { double(:cancel) }
    let(:trip) { build_stubbed(:trip) }

    before do
      sign_in

      Proposal::Cancel.should_receive(:new).with("proposal_id" => "42").and_return(cancel)
      cancel.should_receive(:save).and_return(true)
      cancel.stub(:trip).and_return(trip)

      post :create, proposal_id: 42
    end

    it { should redirect_to(trip) }
    it { should assign_to(:cancel).with(cancel) }

    pending "when creation failed"
  end
end
