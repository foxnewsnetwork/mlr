module Negotiations
  class Discussion
    class Message
      attr_accessor :from, :content
      extend ::Models::HasActiveRecord
      class << self
        private
        def _from_record(record)
          new.tap do |message|
            message.from = record.company
            message.content = record.content
          end
        end
      end


      class << self
        def from_company_with_text(company, text)
          new.tap do |message|
            message.from = company
            message.content = text
          end
        end
      end

    end
  end
end