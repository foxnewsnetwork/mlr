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
    end
  end
end
