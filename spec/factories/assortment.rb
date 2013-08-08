FactoryGirl.define do
  factory :assortment do
    name
    association :category
  end
end
