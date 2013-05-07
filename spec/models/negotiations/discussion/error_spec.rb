require 'spec_helper'

describe Negotiations::Discussion::Error do
  let(:api) { Negotiations::Discussion::Error }
  describe "::model" do
    specify { api.model.should eq Negotiations::Discussion }
  end
end