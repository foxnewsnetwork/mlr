module Negotiations
  class Offer
    attr_accessor :price, :from
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
      def default_from_listing(listing)
        from_person_with_price(listing.seller, listing.price)
      end

      def from_person_with_price(person, price)
        new.tap do |offer|
          offer.price = price
          offer.from = person
        end
      end
    end
  end
end