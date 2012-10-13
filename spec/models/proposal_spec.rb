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
end
