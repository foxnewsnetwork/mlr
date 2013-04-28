module Negotiations
  class Discussion
    attr_accessor :listing, :messages, :buyer, :seller, :offers

    class << self
      def on_listing_from_buyer(listing, buyer)
        new.tap do |discussion|
          discussion.listing = Listing.normalize listing
          discussion.buyer = Buyer.normalize buyer
          discussion.seller = discussion.listing.seller
          discussion.messages = []
          discussion.offers = []
        end
      end
    end

    def offer_from(offer, person)
      self.offers << Offer.from_person_with_price(person, price)
    end

    def message_from(string, person)
      self.messages << Discussion::Message.from_person_with_text(person, string)
    end

    def accept_offer(offer, person=nil)
      Offer.normalize(offer).accept_offer person
    end

    def decline_offer(offer, person=nil)
      Offer.normalize(offer).decline_offer person
    end

  end
end