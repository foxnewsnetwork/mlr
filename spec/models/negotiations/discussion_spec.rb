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
        ::FakeRecord.any_instance.should_receive(:listing).and_return(nil)
        ::FakeRecord.any_instance.should_receive(:buyer).and_return
        Negotiations::Discussion.record_model = ::FakeRecord
      end
      after :each do
        Negotiations::Discussion.record_model = Negotiations::Discussion::Record
      end
      specify { discussion.should_not be_shit }

    end
  end
end