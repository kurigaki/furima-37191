FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password = Faker::Internet.password(min_length: 6)
    password {password}
    password_confirmation {password}
    last_name             {'あああ'}
    first_name            {'あああ'}
    last_name_kana        {'アアア'}
    first_name_kana       {'アアア'}
    birth                 {'2000/01/01'}
  end
end