module Negotiations
  class << self
    def from_listing_and_buyer(listing, buyer)
      Discussion.from_listing_and_buyer(listing, buyer)
    end

    def from_discussion_id(id)
      Discussion.normalize id
    end
  end
end
