require 'spec_helper'

describe Negotiations::Controllers::Discussions::MessagesController do
  describe "#create" do
    let(:create) { post :create, :discussion_id => rand(123), :message => @message, :format => :json }
    before :each do
      Negotiations::Discussion.record_model = ::FakeRecord
      ::FakeRecord.any_instance.should_receive(:messages).and_return([])
      ::FakeRecord.any_instance.should_receive(:offers).and_return([])
      @message = { :company => 33, :text => Faker::Lorem.sentence }
    end
    after :each do
      Negotiations::Discussion.record_model = nil
    end
    it "should have created a new message" do
      expect { create }.to change(controller.discussion.messages, :count).by 1
    end
    context "correctness" do
      before :each do
        create
      end
      let(:messages) { controller.discussion.messages }
      it "should create an actual message" do
        messages.count.should eq 1
        messages.first.should be_a Negotiations::Discussion::Message
      end
    end
  end
end  