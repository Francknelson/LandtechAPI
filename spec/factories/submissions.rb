FactoryBot.define do
  factory :submission do
    association :job
    name { Faker::Lorem.name }
    email { Faker::Internet.email }
    mobile_phone { Faker::PhoneNumber.cell_phone }
    resume { Faker::Lorem.paragraph }
  end
end
