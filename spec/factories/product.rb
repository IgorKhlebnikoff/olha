FactoryGirl.define do
  sequence(:description) { |n| "Description #{n}" }

  factory :product do
    name
    description
    association :assortment
  end
end
