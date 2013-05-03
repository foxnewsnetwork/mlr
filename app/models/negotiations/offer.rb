module Negotiations
  class Offer
    attr_accessor :price, :from, :status
    extend Models::HasActiveRecord
    _record_model = Offer::Record
    _error_model = Offer::Error
    class << self
      private
      def _from_record(record)
        new.tap do |offer|
          offer.price = record.price
          offer.from = User.normalize record.speaker
        end
      end
    end
    class << self
      def from_company_with_price(company, price)
        new.tap do |offer|
          offer.price = price
          offer.from = company
          offer.status = Offer::Status.from_company_and_state company, :new
        end
      end
    end

    def accepted?
      self.status.state == :accepted
    end

    def accept_offer!(company)
      self.status = Offer::Status::from_company_and_state company, :accepted
      return self
    end

    def declined?
      self.status.state == :declined
    end

    def decline_offer!(company)
      self.status = Offer::Status::from_company_and_state company, :declined
      return self
    end
  end
end