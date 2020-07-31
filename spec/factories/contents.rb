FactoryBot.define do
  factory :content do
    title { 'スマホの色は？'}
    association :user
  end
end
