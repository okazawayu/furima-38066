FactoryBot.define do
  factory :item do
    after(:build) do |item|
      item.image.attach(io: File.open('spec/test.png'), filename: 'test.png')
    end
    item_name          { Faker::Name.initials }
    description        { Faker::Name.initials }
    category_id        { Faker::Number.between(from: 2, to: 11) }
    condition_id       { Faker::Number.between(from: 2, to: 7) }
    charge_id          { Faker::Number.between(from: 2, to: 3) }
    area_id            { Faker::Number.between(from: 2, to: 48) }
    ship_date_id       { Faker::Number.between(from: 2, to: 4) }
    price              { Faker::Number.between(from: 300, to: 9_999_999) }
    association :user
  end
end
