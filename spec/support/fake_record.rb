class FakeRecord
  attr_accessor :id
  class << self
    def find_by_id(id)
      new.tap do |fr|
        fr.id = id
      end
    end
    # id < 666 = real
    # id >= 666 = fake
    def method_missing(method, *args)
      id = args.first.to_i || 1
      if id < 666
        new
      else
        nil
      end
    end
  end
  # returns you pure trash values
  def method_missing(method, *args)
    Faker::Company.bs
  end
end