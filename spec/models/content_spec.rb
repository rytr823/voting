require 'rails_helper'

RSpec.describe Content, type: :model do
  let(:user) { FactoryBot.create(:user) }
  describe '#create' do
    before do
      @content = build(:content)
    end

    # 全てのカラムが存在すれば登録可能
    it 'is valid all column' do
      expect(@content).to be_valid
    end

    # titleが空であれば登録できないこと
    it 'is invalid without a title column' do
      @content.title = nil
      @content.valid?
      expect(@content.errors[:title]).to include('を入力してください')
    end

    # userが空であれば登録できないこと
    it 'is invalid without a user' do
      @content.user = nil
      @content.valid?
      expect(@content.errors[:user]).to include('を入力してください')
    end
  end
end
