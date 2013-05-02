module ChineseFactory
  class << self
    def listing(seller=nil)
      ::Negotiations::Listing.new.tap do |l|
        l.title = "test"
        l.pictures = []
        l.thumbnails = []
        l.price = 10
        l.seller = seller || ChineseFactory.company
        l.listing_id = 1
      end
    end
  end
end