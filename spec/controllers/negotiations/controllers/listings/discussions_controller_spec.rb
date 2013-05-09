require 'spec_helper'

describe Negotiations::Controllers::Listings::DiscussionsController do
  describe "#create" do
    let(:create) { post :create, :listing_id => 1, :buyer_id => 1, :format => "json" }
    context "mocked record" do
      before :each do
        company_record = Class.new(FakeRecord)
        Negotiations::Company.record_model = company_record

        listing_record = Class.new(FakeRecord)
        Negotiations::Listing.record_model = FakeRecord
        
        discussion_record = Class.new(FakeRecord)
        Negotiations::Discussion.record_model = discussion_record

        create
      end
      after :each do
        Negotiations::Company.record_model = nil
        Negotiations::Listing.record_model = nil
        Negotiations::Discussion.record_model = nil
      end
      context "ctrl-object" do
        let(:discussion) { controller.discussion }
        it "should create a proper discussion" do
          discussion.should be_a Negotiations::Discussion
          discussion.listing.should be_a Negotiations::Listing
          discussion.buyer.should be_a Negotiations::Company
        end
      end
      context "response" do
        subject { JSON.parse response.body }
        it "should respond with a proper json" do
          should have_key "listing"
          should have_key "offers"
          should have_key "messages"
          should have_key "buyer"
          should have_key "seller"
        end
      end
    end
  end
end