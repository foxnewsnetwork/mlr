module Negotiations
  class Listing
    class Picture < ::ActiveRecord::Base
      self.table_name = "listing_pictures"
    end
  end
end