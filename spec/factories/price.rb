FactoryGirl.define do
  factory :price do
    amount 1000.15
    association :currency
  end
end
