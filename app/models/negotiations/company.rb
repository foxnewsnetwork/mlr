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

module Negotiations
  class Company
    attr_accessor :name, :email, :company_id
    extend ::Models::HasActiveRecord
    error_model = Error
    record_model = Record
    class << self
      private
      def _from_record(record)
        new.tap do |c|
          c.name = record.name
          c.email = record.email
          c.company_id = record.id
        end
      end
    end
  end
end
