FactoryBot.define do
  factory :review do
    text { Faker::Lorem.paragraph }
    association :user
    association :anime
  end
end
