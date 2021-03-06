# == Schema Information
#
# Table name: listings
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  seller_id  :integer
#  price      :decimal(14, 4)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

module Negotiations
  class Listing
    class Record < ::ActiveRecord::Base
      self.table_name = "listings"
      attr_accessible :title, :price

      belongs_to :seller, :foreign_key => :seller_id, :class_name => Negotiations::Company::Record
    end
  end
end
