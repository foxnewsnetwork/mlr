require 'spec_helper'

describe Negotiations::Discussion::Message do
  let(:api) { Negotiations::Discussion::Message }

  describe "::normalize" do
    before :each do
      api.record_model = ::FakeRecord
      @id = 134
      @company = ChineseFactory.company
      ::FakeRecord.any_instance.should_receive(:company).and_return(@company)
    end
    after :each do
      api.record_model = nil
    end
    let(:message) { api.normalize @id }
    it "should be a valid message" do
      message.should be_a api
    end
    it "should be from the correct person" do
      message.from.should eq @company
    end
    it "should not have blank content" do
      message.content.should_not be_blank
    end
  end
end