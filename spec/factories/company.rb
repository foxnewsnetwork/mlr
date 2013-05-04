FactoryGirl.define do
  factory :company, :class => Negotiations::Company::Record, :aliases => [:seller, :buyer] do
    name Faker::Company.name
    email Faker::Internet.email 
  end
end