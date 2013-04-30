module Negotiations
  class Company
    class Error < ::Exception
      class << self
        def from_404(id=nil)
          new.tap do |e|
            e.message = "Company record #{id.to_s} doesn't exist\n\n"
          end
        end
      end

      def method_missing(method, *args)
        self.message += "You expected to call #{method.to_s} with #{args.to_s} on a Negotiations::Company object, but got an error instead!\n\n"
      end

    end
  end
end