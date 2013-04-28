module Negotiations
  class << self
    def on_listing_from_buyer(listing, buyer)
      Discussion.on_listing_from_buyer(listing, buyer)
    end

    def find_from_listing_and_buyer(listing, buyer)

    end

  end
end
