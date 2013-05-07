require 'spec_helper'

describe Negotiations::Listing do
  context "sanity" do
    before :each do
      @listing = ChineseFactory.listing
    end
    it "should have generated a valid listing object" do
      @listing.should be_a Negotiations::Listing
    end
  end
  describe "::normalize" do
    before :each do
      Negotiations::Listing.record_model = ::FakeRecord
      ::FakeRecord.any_instance.should_receive(:seller).and_return(ChineseFactory.company)
    end
    after :each do
      Negotiations::Listing.record_model = nil
    end
    let(:listing) { Negotiations::Listing.normalize 13 }
    it "should create a valid listing" do
      listing.should be_a Negotiations::Listing
      listing.seller.should be_a Negotiations::Company
    end
  end
end