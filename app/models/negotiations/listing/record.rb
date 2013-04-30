module Negotiations
  class Listing
    class Record < ::ActiveRecord::Base
      self.table_name = "listings"
    end
  end
end