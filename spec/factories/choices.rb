FactoryBot.define do
  factory :choice do
    text { 'ホワイト'}
    association :content
  end
end
