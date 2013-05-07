module Negotiations
  class Company
    class Error < ::Models::GenericError
      class << self
        def model
          Negotiations::Company
        end
      end
    end
  end
end