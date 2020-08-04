require 'rails_helper'

RSpec.describe Vote, type: :model do
  describe '#create' do
    let(:user) {FactoryBot.create(:user)}
    before do
      @vote = build(:vote)
    end

    # 全てのカラムが存在すれば登録可能
    it 'is valid all column' do
      expect(@vote).to be_valid
    end  

    # userが空であれば登録できない
    it 'is invalid without a user' do
      @vote.user = nil
      @vote.valid?
      expect(@vote.errors[:user]).to include('を入力してください')
    end

    # cotentが空であれば登録できない
    it 'is invalid without a content' do
      @vote.content = nil
      @vote.valid?
      expect(@vote.errors[:content]).to include('を入力してください')
    end

    # choiceが空であれば登録できない
    it 'is invalid without a choice' do
      @vote.choice = nil
      @vote.valid?
      expect(@vote.errors[:choice]).to include('を入力してください')
    end

    # contentが重複してはならない
    it 'is invalid with a duplicate content' do
      
      vote = create(:vote)
      
      
      another_vote = build(:vote, content: vote.content)
      another_vote.valid?
      expect(another_vote.errors[:content]).to include('はすでに存在します')
    end
  end
end
