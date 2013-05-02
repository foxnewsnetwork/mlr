module Negotiations
  class Listing
    class Error < ::Models::GenericError
      class << self
        def model
          Negotiations::Listing
        end
      end
    end
  end
end