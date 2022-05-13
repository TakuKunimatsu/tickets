FactoryBot.define do
  factory :admin_user do
    company_name { Faker::Company.name }
    email { Faker::Internet.free_email }
    password = Faker::Lorem.characters(number: 6, min_alpha: 1, min_numeric: 1)
    password { password }
    password_confirmation { password }
  end
end