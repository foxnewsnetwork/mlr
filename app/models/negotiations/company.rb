module Negotiations
  class Company
    attr_accessor :name, :email, :company_id

    class << self
      def normalize(company_or_id)
        return company_or_id if company_or_id.is_a? Company
      end

      private

      def _load_from_record(id)
        record = Company::Record.find_by_id(id)
        return Company::Error.from_404 if record.nil?
        _from_record record
      end

      def _from_record(record)
        new.tap do |c|
          c.name = record.name
          c.email = record.email
          c.company_id = record.id
        end
      end
    end
  end
end