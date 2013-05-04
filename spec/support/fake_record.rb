class FakeRecord
  class << self
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