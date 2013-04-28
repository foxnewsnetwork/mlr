module Negotiations
  class Listing
    class Picture < ::ActiveRecord::Base
      set_table_name "listing_pictures"
    end
  end
end