require 'spec_helper'

describe Trip do
  it { should have_many :passengers }
  it { should have_many :passengers_trips }
  it { should belong_to :driver }
end
