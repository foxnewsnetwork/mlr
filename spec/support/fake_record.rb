class FakeRecord
  attr_accessor :id
  class << self
    def find_by_id(id)
      new.tap do |fr|
        fr.id = id
      end
    end
  end
  # returns you pure trash values
  def method_missing(method, *args)
    Faker::Company.bs
  end
end