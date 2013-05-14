module Negotiations
  class Discussion
    class Message
      class Record < ::ActiveRecord::Base
        self.table_name = "messages"
      end
    end
  end
end