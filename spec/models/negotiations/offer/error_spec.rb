require 'spec_helper'

describe Negotiations::Offer::Error do
  let(:api) { Negotiations::Offer::Error }
  describe "::model" do
    specify { api.model.should eq Negotiations::Offer }
  end
end  