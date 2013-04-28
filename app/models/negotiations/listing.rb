module Negotiations
  class Listing
    class << self
      def normalize(listing_or_id)
        return listing_or_id if listing_or_id.is_a? Negotiations::Listing
        _load_from_record(listing_or_id)
      end

      private

      def _load_from_record(id)
        record = Listing::Record.find_by_id id
        return Listing::Error.from_404 if record.nil?
        _from_record record
      end

      def _from_record(record)
        new.tap do |listing|
          listing.title = record.title
          listing.pictures = record.pictures
          listing.thumbnails = record.thumbnails
          listing.price = record.price
          listing.seller = record.seller
        end
      end
    end

    attr_accessor :title, :pictures, :thumbnails, :price, :seller
  end
end