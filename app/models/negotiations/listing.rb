module Negotiations
  class Listing
    extend ::Models::HasActiveRecord
    class << self
      private
      def _from_record(record)
        new.tap do |listing|
          listing.title = record.title
          listing.pictures = record.pictures
          listing.thumbnails = record.thumbnails
          listing.price = record.price
          listing.seller = Negotiations::Company.normalize record.seller
          listing.listing_id = record.id
        end
      end
    end

    attr_accessor :title, :pictures, :thumbnails, :price, :seller, :listing_id
  end
end