module ChineseFactory
  class << self
    def offer(person=nil)
      ::Negotiations::Offer.new.tap do |offer|
        offer.price = rand 999
        offer.from = person || ChineseFactory.company
      end
    end
  end
end