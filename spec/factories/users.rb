FactoryBot.define do
  factory :user do
    transient do
      person {Gimei.name}
    end
    nickname              {Faker::Name.name}
    email                 {Faker::Internet.free_email}
    password = Faker::Internet.password(min_length: 6)
    password {password}
    password_confirmation {password}
    last_name             {person.first.kanji}
    first_name            {person.last.kanji}
    last_name_kana        {person.first.katakana}
    first_name_kana       {person.last.katakana}
    birth                 {Faker::Date.between(from: '1930-1-1', to: '2016-12-31')}
  end
end