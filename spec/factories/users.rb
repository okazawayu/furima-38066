FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end

    id { Faker::Number.between(from: 1, to: 100) }
    nickname              { Faker::Internet.user_name }
    email                 { Faker::Internet.free_email }
    password              { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    birth_date            { Faker::Date.backward }
    first_name            { person.first.kanji }
    last_name             { person.last.kanji }
    first_name_kana       { person.first.katakana }
    last_name_kana        { person.last.katakana }
  end
end
