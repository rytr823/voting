FactoryBot.define do
  factory :vote do
    association :user
    association :content
    association :choice
  end
end
