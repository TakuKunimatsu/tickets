FactoryBot.define do
  factory :performance do
    name { Faker::Lorem.word }
    theater { Faker::Number.between(from: 2, to: 11) }
    start_day { Faker::Date.forward(days: 1) }
    last_day { Faker::Date.forward(days: 7) }
    info { Faker::Lorem.sentence }
    price { Faker::Number.between(from: 0, to: 9_999_999) }

    association :admin_user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
