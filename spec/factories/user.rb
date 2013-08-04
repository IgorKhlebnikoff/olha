FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    password '1qaz2wsx'
    password_confirmation '1qaz2wsx'
  end

  factory :user_with_profile, parent: :user do
    after(:create) do |user|
      FactoryGirl.create(:profile, user: user)
    end
  end
end 
