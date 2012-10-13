require 'spec_helper'

describe Comment do
  it { should validate_presence_of :text }
  it { should ensure_length_of(:text).is_at_most(250) }
end
