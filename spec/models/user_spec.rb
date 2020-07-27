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
      expect(@user.errors[:nickname]).to include("を入力してください")
    end

    # emailが空であれば登録できないこと
    it 'is invalid without a email' do
      @user.email = nil
      @user.valid?
      expect(@user.errors[:email]).to include("を入力してください")
    end

    # passwordが空であれば登録できないこと
    it 'is invalid without a password' do
      @user.password = nil
      @user.valid?
      expect(@user.errors[:password]).to include("を入力してください", "は半角英数字混合で入力してください")
    end

    # passwordが存在してもpassword_confirmationが空では登録できないこと
    it 'is invalid without a password_confirmation although with a password' do
      @user.password_confirmation = nil
      @user.valid?
      expect(@user.errors[:password_confirmation]).to include("は半角英数字混合で入力してください")
    end

    # 重複したemailが存在する場合は登録できないこと
    it 'is invalid with a duplicate email address' do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include('はすでに存在します')
    end

    # emailが@を含まない場合は登録できないこと
    it 'is invalid with a email contains @' do
      @user.email = 'aaagmail.com'
      @user.valid?
      expect(@user.errors[:email]).to include('は不正な値です')
    end

    # passwordが6字以上であること
    it 'is valid with a password that has more than 6 characters' do
      @user.password = 'abc000'
      @user.password_confirmation = 'abc000'
      @user.valid?
      expect(@user).to be_valid
    end

    # passwordが5文字以下であれば登録できないこと
    it 'is invalid with a password that has less than 5 characters' do
      @user.password = 'ab000'
      @user.password_confirmation = 'ab000'
      @user.valid?
      expect(@user.errors[:password]).to include("は6文字以上で入力してください", "は半角英数字混合で入力してください")
    end

    # passwordが半角英数時混合以外であれば登録できないこと
    it 'is invalid without a password except mixed with half-width alphanumeric characters' do
      @user.password = 000000
      @user.password_confirmation = 000000
      @user.valid?
      expect(@user.errors[:password]).to include('は半角英数字混合で入力してください')
    end

  end 
end
