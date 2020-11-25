FactoryBot.define do
  factory :like do
    association :user
    association :anime
  end
end
