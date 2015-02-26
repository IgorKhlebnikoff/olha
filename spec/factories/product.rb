FactoryGirl.define do
  sequence(:description) { |n| "Description #{n}" }

  factory :product do
    name 'some product'
    description 'some description'
    association :assortment
  end
end
