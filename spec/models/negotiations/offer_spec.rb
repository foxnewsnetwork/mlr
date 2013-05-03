require 'spec_helper'

describe Negotiations::Offer do
  let(:api) { Negotiations::Offer }
  describe "::from_company_with_price" do
    let(:offer) { api.from_company_with_price @company, @price }
    before :each do
      @company = ChineseFactory.company
      @buyer = ChineseFactory.company
      @price = rand 82342
    end
    describe "#from" do
      specify { offer.from.should eq @company }
    end
    describe "#price" do
      specify { offer.price.should eq @price }
    end
    describe "#status" do
      let(:status) { Negotiations::Offer::Status.from_company_and_state @company, :new }
      specify { offer.status.state.should eq status.state }
      specify { offer.status.changed_by.should eq status.changed_by }
    end
    describe "#accept_offer!" do
      let(:accepted_offer) { offer.accept_offer! @buyer }
      let(:status) { Negotiations::Offer::Status.from_company_and_state @buyer, :accepted }
      it "should still return the modified state offer" do
        accepted_offer.should be_a api
      end
      it "should correctly designed in its state that it has been accepted" do
        accepted_offer.status.state.should eq :accepted
      end
      describe "#accepted?" do
        it "should provide a function that tells me if an offer is accepted or not" do
          accepted_offer.should be_accepted
          accepted_offer.should_not be_declined
        end
      end
      it "should be changed by the correct person" do
        accepted_offer.status.changed_by.should eq @buyer
      end
    end
    describe "#decline_offer!" do
      let(:declined_offer) { offer.decline_offer! @buyer }
      it "should still return an offer" do
        declined_offer.should be_a api
      end
      it "should have the correct status" do
        declined_offer.status.state.should eq :declined
      end
      describe "#declined?" do
        it "should be declined, thus not accepted" do
          declined_offer.should_not be_accepted
          declined_offer.should be_declined
        end
      end
      it "should be declined by the correct person" do
        declined_offer.status.changed_by.should eq @buyer
      end
    end
  end
end