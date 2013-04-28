module Negotiations
  class Offer
    attr_accessor :price, :from

    class << self
      def normalize(offer)
        return offer if offer.is_a? Offer
        _load_from_record offer.to_i
      end

      def default_from_listing(listing)
        from_person_with_price(listing.seller, listing.price)
      end

      def from_person_with_price(person, price)
        new.tap do |offer|
          offer.price = price
          offer.from = person
        end
      end

      private

      def _load_from_record(id)
        record = Offer::Record.find offer
        return Offer::Error.from_404 if record.nil?
        _from_record record
      end

      def _from_record(record)
        new.tap do |offer|
          offer.price = record.price
          offer.from = User.normalize record.speaker
        end
      end

    end
  end
end