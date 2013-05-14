module ChineseFactory
  class << self
    def discussion
      ::Negotiations::Discussion.new.tap do |d|
        d.listing = ChineseFactory.listing
        d.messages = []
        d.buyer = ChineseFactory.company
        d.offers = []
        d.discussion_id = 13
      end
    end
  end
end