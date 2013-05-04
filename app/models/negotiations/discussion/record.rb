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

module Negotiations
  class Discussion
    class Record < ::ActiveRecord::Base
      self.table_name = "discussions"
      belongs_to :listing, :class_name => Negotiations::Listing::Record, :foreign_key => :listing_id
      belongs_to :buyer, :class_name => Negotiations::Company::Record, :foreign_key => :buyer_id
    end
  end
end
