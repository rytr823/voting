FactoryBot.define do
  factory :user do
    nickname { 'user' }
    sequence(:email) { |n| "aaa#{n}@gmail.com" }
    password { 'abc000000' }
    password_confirmation { 'abc000000' }
  end
end
