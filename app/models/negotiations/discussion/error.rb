module Negotiations
  class Discussion
    class Error < ::Models::GenericError
      class << self
        def model
          Negotiations::Discussion
        end
      end
    end
  end
end