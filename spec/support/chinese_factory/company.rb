module ChineseFactory
  class << self
    def company
      ::Negotiations::Company.new.tap do |c|
        c.name = Faker::Company.name
        c.email = Faker::Internet.email
        c.company_id = rand 999
      end
    end
  end
end