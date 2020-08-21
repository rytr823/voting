FactoryBot.define do
  factory :image do
    subject { create(:image).image }
    it { is_expected.to be_an_instance_of(ActiveStorage::Attached::One) }
  end 
end