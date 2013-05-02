module ChineseFactory
  class << self
    def message(person=nil)
      ::Negotiations::Discussion::Message.new.tap do |msg|
        msg.from = person || ChineseFactory.company
        msg.content = Faker::Lorem.sentence
      end
    end
  end
end