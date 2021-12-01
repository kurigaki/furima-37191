FactoryBot.define do
  factory :purchase_address do
    postal_code { '123-4567' }
    shipping_area_id { Faker::Number.between(from: 1, to: 47) }
    municipalities { '横浜市緑区' }
    address { '青山1-1-1' }
    building_name { '柳ビル103' }
    phone_number { '09012345678' }
    token {"tok_abcdefghijk00000000000000000"}
  end
end
