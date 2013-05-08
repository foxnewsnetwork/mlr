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
  context "factory" do
    before :each do
      @builder = lambda { FactoryGirl.generate :email }
      @prop_sequential_emails = lambda { |builder| builder.call.should_not eq builder.call }
    end
    it "should necessary have different ids" do
      100.times { @prop_sequential_emails.call @builder }
    end
  end
  context "relational functionality" do
    let(:record) { FactoryGirl.create :discussion, :buyer => @buyer_record, :listing => @listing_record }
    before :each do
      @buyer_record = FactoryGirl.create :buyer, :email => FactoryGirl.generate(:email)
      @listing_record = FactoryGirl.create :listing, :seller => FactoryGirl.create(:seller, :email => FactoryGirl.generate(:email))
    end
    it "should be an valid active record instance" do
      record.should be_a api
    end
    it "should be properlly connected to a parenting listing and a company" do
      record.listing.should be_a Negotiations::Listing::Record
    end
    it "should have the correct listing" do
      record.listing.should eq @listing_record
    end
    it "should be connected to its buyer" do
      record.buyer.should be_a Negotiations::Company::Record
    end
    it "should have the correct buyer" do
      record.buyer.should eq @buyer_record
    end
  end
end
