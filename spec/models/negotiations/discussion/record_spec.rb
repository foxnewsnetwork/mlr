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
  let(:api) { Negotiations::Discussion::Record }

  context "relational functionality" do
    let(:record) { FactoryGirl.create :discussion }
    it "should be an valid active record instance" do
      pending "Don't know the syntax to use factorygirl"
      record.should be_a api
    end
  end
end
