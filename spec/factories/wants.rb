FactoryBot.define do
  factory :want do
    association :user
    association :anime
  end
end
