require 'spec_helper'

describe Negotiations::Discussion::Message::Error do
  let(:api) { Negotiations::Discussion::Message::Error }
  describe "::model" do
    specify { api.model.should eq Negotiations::Discussion::Message }
  end
end