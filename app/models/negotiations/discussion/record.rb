module Negotiations
  class Discussion
    class Record < ::ActiveRecord::Base
      self.table_name = "discussions"
    end
  end
end