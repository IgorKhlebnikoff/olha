FactoryGirl.define do
  sequence(:name) { |n| "Name #{n}" }

  factory :category do
    name
  end
end
