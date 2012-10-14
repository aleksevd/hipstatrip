require "spec_helper"

describe Search do
  let(:search) { Search.new }

  describe "#geocode" do
    it "returns nil if given blank value" do
      search.send(:geocode, "").should be_nil
      search.send(:geocode, nil).should be_nil
    end

    it "returns nil if cannot geocode value" do
      VCR.use_cassette("search/geocode/invalid") do
        search.send(:geocode, "qerwdsfa").should be_nil
      end
    end

    it "returns point when successful" do
      VCR.use_cassette("search/geocode/success") do
        search.send(:geocode, "Moscow").should == Point.from_x_y(37.61802291870117, 55.751708984375, 4326)
      end
    end
  end
end
