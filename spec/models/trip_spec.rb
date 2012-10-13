require 'spec_helper'

describe Trip do
  it { should have_many :passengers }
  it { should belong_to :driver }
end
