FactoryGirl.define do
  sequence :email do |n|
    n.to_s.concat Faker::Internet.email
  end
  factory :company, :class => Negotiations::Company::Record, :aliases => [:seller, :buyer] do
    name Faker::Company.name
    email FactoryGirl.generate :email
  end
end