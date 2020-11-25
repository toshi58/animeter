FactoryBot.define do
  factory :watch do
    association :user
    association :anime
  end
end
