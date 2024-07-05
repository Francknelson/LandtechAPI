FactoryBot.define do
  factory :job do
    association :recruiter, factory: :recruiter
    title { Faker::Lorem.sentence }
    description { Faker::Lorem.sentences.join(' ') }
    start_date { Faker::Date.backward(days: 14) }
    end_date { Faker::Date.backward(days: 5) }
    status { "Active" }
    skills { Faker::Lorem.words(number: 3).join(', ') }
  end
end
