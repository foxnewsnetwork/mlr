require 'spec_helper'

describe Negotiations::Listing::Error do
  let(:api) { Negotiations::Listing::Error }

  describe "::model" do
    it "should have the correct referencing model" do
      api.model.should eq Negotiations::Listing
    end
  end
end