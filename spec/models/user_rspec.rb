require 'rails_helper'

describe User do
  describe '#create' do
    before do
      @user = build(:user)
    end

    # 全てのカラムが存在すれば登録できる
    it 'is valid with all column' do
      expect(@user).to be_valid
    end
    
    # nicknameが空であれば登録できないこと
    it 'is invalid without a nickname' do
        @user.nickname = nil
        @user.valid?
        expect(@item.errors[:nickname]).to include("を入力してください")
      
    end

  
end
