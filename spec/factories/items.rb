FactoryBot.define do
  factory :item do
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
    name              {Faker::Name.name}
    explanation       {Faker::Lorem.sentence}
    category_id       {2}
    condition_id      {2}
    shipping_cost_id  {2}
    shipping_area_id  {2}
    shipping_time_id  {2}
    price             {1000}
    user_id           {2}
  end
end
