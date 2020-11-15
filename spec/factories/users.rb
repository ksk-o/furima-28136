FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 3)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    last_name             {"あイ右"}
    first_name            {"えオ火"}
    last_name_furigana    {"アイウ"}
    first_name_furigana   {"エオカ"}
    birthday              {Faker::Date.birthday}
  end
end