FactoryBot.define do
  factory :recruiter do
    name { Faker::Name.name }
    username { Faker::Internet.user_name }
    email { Faker::Internet.email }
    password { Faker::Internet.password }
  end
end
