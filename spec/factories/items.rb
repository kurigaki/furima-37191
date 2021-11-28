FactoryBot.define do
  factory :item do
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
    name              { Faker::Name.name }
    explanation       { Faker::Lorem.sentence }
    category_id       { Faker::Number.between(from: 2, to: 11) }
    condition_id      { Faker::Number.between(from: 2, to: 7) }
    shipping_cost_id  { Faker::Number.between(from: 2, to: 3) }
    shipping_area_id  { Faker::Number.between(from: 1, to: 47) }
    shipping_time_id  { Faker::Number.between(from: 2, to: 4) }
    price             { Faker::Number.between(from: 300, to: 9_999_999) }
  end
end
