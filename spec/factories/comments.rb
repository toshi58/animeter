FactoryBot.define do
  factory :comment do
    text {Faker::Lorem.paragraph}
    association :user
    association :review
  end
end
