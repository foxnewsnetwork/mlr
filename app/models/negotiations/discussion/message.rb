module Negotiations
  class Discussion
    class Message
      attr_accessor :from, :content

      class << self
        def from_person_with_text(person, text)
          new.tap do |message|
            message.from = person
            message.content = text
          end
        end
      end

    end
  end
end