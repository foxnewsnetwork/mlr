module Negotiations
  class Offer
    class Error < ::Models::GenericError
      def self.model
        Negotiations::Offer
      end
    end
  end
end