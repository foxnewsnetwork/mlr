FactoryGirl.define do
  factory :listing, :class => Negotiations::Listing::Record do
    title Faker::Company.catch_phrase
    price 234234
  end
end