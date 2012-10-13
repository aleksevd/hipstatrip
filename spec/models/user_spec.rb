require 'spec_helper'

describe User do
  describe "created from factory" do
    subject { create :user }

    it { should be_valid }
  end

  it { should have_many :trips }
  it { should belong_to :trip }
end
