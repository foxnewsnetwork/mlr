# == Schema Information
#
# Table name: listing_pictures
#
#  id                          :integer          not null, primary key
#  picture_file_name           :string(255)
#  picture_content_type        :string(255)
#  picture_file_size           :integer
#  picture_updated_at          :datetime
#  {:null=>false}_file_name    :string(255)
#  {:null=>false}_content_type :string(255)
#  {:null=>false}_file_size    :integer
#  {:null=>false}_updated_at   :datetime
#  listing_id                  :integer          not null
#  created_at                  :datetime         not null
#  updated_at                  :datetime         not null
#

module Negotiations
  class Listing
    class Picture < ::ActiveRecord::Base
      self.table_name = "listing_pictures"
    end
  end
end
