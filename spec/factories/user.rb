FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    password '1qaz2wsx'
    password_confirmation '1qaz2wsx'
  end

  factory :user_with_profile, parent: :user do
    after(:create) do |user|
      user.profile.update_attributes(first_name: 'Oleg',
                                    last_name: 'Sobchuk', 
                                    phone_number: '0930592359', 
                                    gender: 'Male', 
                                    country: 'UA')
    end
  end
end 
