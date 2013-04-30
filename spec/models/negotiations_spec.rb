require 'spec_helper'

describe Negotiations do
  before :each do
    @seller = Negotiations::Company.new.tap do |c|
      c.name = "test seller company"
      c.email = "test@company.gov"
      c.company_id = 12
    end
    @buyer = Negotiations::Company.new.tap do |c|
      c.name = "Test buyer company"
      c.email = "buyer@company.org"
      c.company_id = 10
    end
    @listing = Negotiations::Listing.new.tap do |l|
      l.title = "test"
      l.pictures = []
      l.thumbnails = []
      l.price = 10
      l.seller = @seller
      l.listing_id = 1
    end
  end
  describe "::from_discussion_id" do
    let(:discussion) { Negotiations.from_discussion_id @discussion_id }
    context "when it 404s" do
      before :each do
        @discussion_id = 14432333414
      end

      it "should return with an error object" do
        discussion.should be_a Negotiations::Discussion::Error
      end

      it "should be shitty" do
        discussion.should be_shit
      end
    end
  end
  describe "::from_listing_and_buyer" do
    let(:discussion) { Negotiations.from_listing_and_buyer @listing, @buyer }
    context "mocking w/out db" do
      it "should give me back a discussion object" do
        discussion.should be_a Negotiations::Discussion
      end

      it "should have the correct associated buyer" do
        discussion.buyer.should eq @buyer
      end

      it "should have the correct assocated seller" do
        discussion.seller.should eq @seller
      end

      it "should have the correct assocated listing" do
        discussion.listing.should eq @listing
      end

      it "should not be shitty" do
        discussion.should_not be_shit
      end
    end
  end
end
