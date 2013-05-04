# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :discussion, :class => Negotiations::Discussion::Record do |d|
    listing
    buyer
  end
end
