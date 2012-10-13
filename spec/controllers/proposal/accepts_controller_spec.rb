require "spec_helper"

describe Proposal::AcceptsController do
  describe "POST create" do
    let(:accept) { double(:accept) }
    let(:trip) { build_stubbed(:trip) }

    before do
      sign_in

      Proposal::Accept.should_receive(:new).with("proposal_id" => "42").and_return(accept)
      accept.should_receive(:save).and_return(true)
      accept.stub(:trip).and_return(trip)

      post :create, proposal_id: 42
    end

    it { should redirect_to(trip) }
    it { should assign_to(:accept).with(accept) }

    pending "when creation failed"
  end
end
