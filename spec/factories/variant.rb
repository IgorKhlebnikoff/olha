FactoryGirl.define do
  factory :variant do
    association :product
    association :price
    association :color
    association :size
    in_stock true
    quantity 10
  end
end
