module Negotiations
  class Listing
    class Record < ::ActiveRecord::Base
      set_table_name "listings"
    end
  end
end