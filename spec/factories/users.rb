FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.middle_name }
    email                 { Faker::Internet.free_email }
    password              { 'test12' }
    password_confirmation { password }
    full_name             { Faker::Name.name }
    full_name_kana        { 'カタカナ' }
    birthday              { Faker::Date.birthday }
    introduction          { Faker::Lorem.sentence}
  end
end