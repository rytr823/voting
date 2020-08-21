FactoryBot.define do
  factory :choice do
    text { 'ホワイト' }
    association :content
    after(:build) do |choice|
      choice.image.attach(io: File.open(Rails.root.join('public', 'images', 'test_image.jpg')), filename: 'test_image.jpg')
    end
  end
end
