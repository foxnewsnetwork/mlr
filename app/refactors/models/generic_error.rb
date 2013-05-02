module Models
  class GenericError < Exception
    attr_accessor :errors
      class << self
        def model
          throw "Implement me!"
        end

        def from_404(id=nil)
          new.tap do |e|
            (e.errors ||= []) << "You expected a #{model} object with id #{id}, but no such object as found!"
          end
        end
      end
      def method_missing(method, *args)
          self.errors << "Called #{method} with #{args.to_s}"
        end

      def shit?
        true
      end
  end
end