require 'rails_helper'

RSpec.describe Choice, type: :model do
  let(:content) { FactoryBot.create(:content) }
  describe '#create' do
    before do
      @choice = build(:choice)
    end

    # 全てのカラムが存在すれば登録できること
    it 'is valid all column' do
      expect(@choice).to be_valid
    end
    
    # textが空であれば登録できないこと
    it 'is invalid without a text column' do
      @choice.text = nil
      @choice.valid?
      expect(@choice.errors[:text]).to include("を入力してください")
    end

    # contentが空であれば登録できないこと
    it 'is invalid without a content' do
      @choice.content = nil
      @choice.invalid?
      expect(@choice.errors[:content]).to include("を入力してください")
    end
  end
end
