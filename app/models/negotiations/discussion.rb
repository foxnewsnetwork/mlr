module Negotiations
  class Discussion
    attr_accessor :listing, :messages, :buyer, :seller, :offers, :discussion_id
    
    extend ::Models::HasActiveRecord
    self.record_model = Discussion::Record
    self.error_model = Discussion::Error
    class << self
      private
      def _from_record(record)
        new.tap do |d|
          d.listing = Listing.normalize record.listing
          d.buyer = Company.normalize record.buyer 
          d.seller = Company.normalize record.seller
          d.messages = record.messages.map { |message| Discussion::Message.normalize message }
          d.offers = record.offers.map { |offer| Offer.normalize offer }
          d.discussion_id = record.id
        end
      end
    end

    class << self
      def from_listing_and_buyer(listing, buyer)
        new.tap do |discussion|
          discussion.listing = Listing.normalize listing
          discussion.buyer = Company.normalize buyer
          discussion.seller = discussion.listing.seller
          discussion.messages = []
          discussion.offers = []
        end
      end
    end

    def offer_from(company, price)
      offer = Offer.from_company_with_price(company, price)
      self.offers << offer
      return offer
    end

    def message_from(company, text)
      msg = Discussion::Message.from_company_with_text(company, text)
      self.messages << msg
      return msg
    end

    def accept_offer(company, offer)
      Offer.normalize(offer).accept_offer company
    end

    def decline_offer(company, offer)
      Offer.normalize(offer).decline_offer company
    end

    def shit?
      false
    end

  end
end