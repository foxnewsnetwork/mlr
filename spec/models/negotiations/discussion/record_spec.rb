# == Schema Information
#
# Table name: discussions
#
#  id         :integer          not null, primary key
#  listing_id :integer
#  buyer_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe Negotiations::Discussion::Record do
  before :each do
    Negotiations::Discussion.record_model = nil
  end
  let(:api) { Negotiations::Discussion::Record }

  context "relational functionality" do
    let(:record) { FactoryGirl.create :discussion }
    it "should be an valid active record instance" do
      record.should be_a api
    end
    it "should be properlly connected to a parenting listing and a company" do
      record.listing.should be_a Negotiations::Listing::Record
    end
    it "should be connected to its buyer" do
      record.buyer.should be_a Negotiations::Company::Record
    end
  end
end
