FactoryGirl.define do
  factory :profile do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    phone_number '1234567890'
    gender 'Male'
    country 'UA'
    association :user
  end
end 
