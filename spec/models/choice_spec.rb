require 'rails_helper'

RSpec.describe Choice, type: :model do
  let(:content) { FactoryBot.create(:content) }
  describe '#create' do
    before do
      @choice = build(:choice)
    end
    
    # textがあれば保存できること
    it 'is valid with a text' do
      @choice.image = nil
      expect(@choice).to be_valid
    end

    # imageがあれば保存できること
    it 'is valid with a image' do
      @choice.text = nil
      expect(@choice).to be_valid
    end

    # textとimageがあれば保存できること
    it 'is valid with text and image' do
      expect(@choice).to be_valid
    end


    # textとimage両方が空であれば登録できないこと
    it 'is invalid without text and image column' do
      @choice.text = nil
      @choice.image = nil
      @choice.valid?
      expect(@choice.errors[:text_or_image]).to include("を入力してください")
    end

    # contentが空であれば登録できないこと
    it 'is invalid without a content' do
      @choice.content = nil
      @choice.invalid?
      expect(@choice.errors[:content]).to include('を入力してください')
    end

  end
end
