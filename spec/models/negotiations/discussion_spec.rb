require 'spec_helper'

describe Negotiations::Discussion do
  describe "::normalize" do
    let(:discussion) { Negotiations::Discussion.normalize @discussion_id }
    context "404" do
      before :each do
        @discussion_id = 134384234982485
      end
      specify { discussion.should be_shit }
      specify { discussion.should be_a Negotiations::Discussion::Error }
      specify { discussion.errors.join(", ").should =~ /(expected|discussion)/ }
    end
    context "existing" do
      before :each do
        @discussion_id = 12
        @seller = ChineseFactory.company
        @buyer = ChineseFactory.company
        @listing = ChineseFactory.listing @seller
        @messages = 0.upto(rand 15).map { ChineseFactory.message @seller }
        @offers = 0.upto(rand 15).map { ChineseFactory.offer @buyer }
        ::FakeRecord.any_instance.should_receive(:listing).and_return(@listing)
        ::FakeRecord.any_instance.should_receive(:buyer).and_return(@buyer)
        ::FakeRecord.any_instance.should_receive(:messages).and_return(@messages)
        ::FakeRecord.any_instance.should_receive(:offers).and_return(@offers)
      end
      before(:each) { Negotiations::Discussion.record_model = ::FakeRecord }
      after(:each) { Negotiations::Discussion.record_model = nil }
      specify { discussion.should_not be_shit }
      describe "#offer_from" do
        let(:offer) { discussion.offer_from @buyer, @price }
        before :each do
          @price = 15
        end
        it "should return a new offer" do
          offer.should be_a Negotiations::Offer
        end
        it "should be from the right buyer with the right price" do
          offer.price.should eq @price
          offer.from.should eq @buyer
        end
        it "should increase the amount of offers in stored in the discussion" do
          expect { offer }.to change(discussion.offers, :count).by 1
        end
      end
      describe "#message_from" do
        let(:message) { discussion.message_from @buyer, @message }
        before :each do
          @message = Faker::Company.bs
        end
        it "should return a new message" do
          message.should be_a Negotiations::Discussion::Message
        end
        it "should be the right message" do
          message.content.should eq @message
          message.from.should eq @buyer
        end
        it "should increase the amount of messages associated with this discussion" do
          expect { message }.to change(discussion.messages, :count).by 1
        end
      end
      describe "#accept_offer!" do
        let(:offer) { discussion.accept_offer! @company, @offer }
        before :each do
          @offer = ChineseFactory.offer
          @company = ChineseFactory.company
        end
        it "should return the accepted offer" do
          offer.should be_a Negotiations::Offer
          offer.should be_accepted
        end
      end
      describe "#decline_offer!" do
        let(:offer) { discussion.decline_offer! @company, @offer }
        before :each do
          @offer = ChineseFactory.offer
          @company = ChineseFactory.company
        end
        it "should return the accepted offer" do
          offer.should be_a Negotiations::Offer
          offer.should be_declined
        end
      end
    end
  end
end