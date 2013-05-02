module Negotiations
  class Discussion
    class Message
      class Record < ::ActiveRecord::Base
        table_name = "messages"
      end
    end
  end
end