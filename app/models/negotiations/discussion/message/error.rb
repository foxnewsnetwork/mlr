module Negotiations
  class Discussion
    class Message
      class Error < ::Models::GenericError
        def self.model
          Negotiations::Discussion::Message
        end
      end
    end
  end
end