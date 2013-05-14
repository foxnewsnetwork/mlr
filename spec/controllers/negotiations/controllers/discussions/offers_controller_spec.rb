require 'spec_helper'

describe Negotiations::Controllers::Discussions::OffersController do
  let(:action) { @method.call :discussion_id => rand(123), :offer => @offer }
  before :each do
    Negotiations::Discussion.record_model = ::FakeRecord
    ::FakeRecord.any_instance.should_receive(:messages).and_return([])
    ::FakeRecord.any_instance.should_receive(:offers).and_return([])
  end
  after :each do
    Negotiations::Discussion.record_model = nil
  end
  describe "#create" do
    before :each do
      @method = lambda { |opts| post :create, opts }
      @offer = { :company => rand(123), :price => rand(123) }
    end
    it "should create a new offer" do
      expect { action }.to change(controller.discussion.offers, :count).by 1
    end
  end
  context "offer_record" do
    let(:offer_record) { Class.new(::FakeRecord) }
    before(:each) { Negotiations::Offer.record_model = offer_record }
    after(:each) { Negotiations::Offer.record_model = nil }
    describe "#decline" do
      before :each do
        @method = lambda { |opts| put :decline, opts.merge(:id => rand(123)) }
        controller.should_receive(:current_company).and_return(ChineseFactory.company)
      end
      it "should make a declined offer" do
        action
      end
    end
    describe "#accept" do
      before :each do
        @method = lambda { |opts| put :accept, opts.merge(:id => rand(123) ) }
        controller.should_receive(:current_company).and_return(ChineseFactory.company)
      end
      it "should accept the offer" do
        action
      end
    end
  end
end  