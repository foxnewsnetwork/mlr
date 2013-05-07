require 'spec_helper'

describe Negotiations::Controller do
  describe "#create" do
    let(:create) { post :create, :listing_id => @listing.listing_id, :buyer_id => @buyer.company_id }
    context "mocked record" do
      before :each do
        # @listing = ChineseFactory.listing
        # @buyer = ChineseFactory.company
        # FakeRecord.any_instance.should_receive(:listing).and_return(@listing)
        # FakeRecord.any_instance.should_receive(:buyer).and_return(@buyer)
        # Negotiations::Company.record_model = FakeRecord
        # Negotiations::Listing.record_model = FakeRecord
        # Negotiations::Discussion.record_model = FakeRecord
      end
      it "should create a proper discussion" do
        pending "cannot pass this because rails expects me to put controllers in their own folder"
        create
        controller.discussion.should be_a Negotiations::Discussion
        controller.discussion.buyer.should eq @buyer
        controller.discussion.listing.should eq @listing
      end
    end
  end
end