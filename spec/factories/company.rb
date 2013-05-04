FactoryGirl.define do
  factory :company, :class => Negotiations::Company::Record do
    name Faker::Company.name
    email Faker::Internet.email 
  end
end