# == Schema Information
#
# Table name: companies
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  name                   :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

require 'spec_helper'

describe Negotiations::Company::Record do
  let(:api) { Negotiations::Company::Record }

  context "sanity" do
    before :each do
      @company_record = FactoryGirl.create :company
    end

    specify { @company_record.should be_a api }
    describe "#normalize" do
      let(:company) { Negotiations::Company.normalize @company_record }
      specify { company.should be_a Negotiations::Company }
      specify { company.company_id.should eq @company_record.id }
    end
  end
end
