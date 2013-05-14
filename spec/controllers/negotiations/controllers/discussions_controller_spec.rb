require 'spec_helper'

describe Negotiations::Controllers::DiscussionsController do
  describe "#show" do
    let(:show) { get :show, :id => @discussion.discussion_id, :format => :json }
    
    before :each do
      Negotiations::Discussion.record_model = ::FakeRecord
      ::FakeRecord.any_instance.should_receive(:messages).and_return([])
      ::FakeRecord.any_instance.should_receive(:offers).and_return([])
      @discussion = ChineseFactory.discussion
      show
    end
    after :each do
      Negotiations::Discussion.record_model = nil
    end

    it "should just work" do
      controller.discussion.should be_a Negotiations::Discussion
    end
  end  
end