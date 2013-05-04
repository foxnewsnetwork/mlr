require 'spec_helper'

describe Negotiations::Offer::Status do
  let(:api) { Negotiations::Offer::Status }
  describe "::from_company_and_state" do
    let(:status) { api.from_company_and_state @company, @state }
    context "invalid" do
      before :each do
        @company = ChineseFactory.company
        @state = :faggot
      end
      it "should not create a valid status as I have passed it incorrect data and thus should throw an string" do
        expect { status }.to raise_error(NameError)
      end
    end
  end
end