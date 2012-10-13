require 'spec_helper'

describe PassengersTrip do
  it { should belong_to :trip }
  it { should belong_to :passenger }
end
