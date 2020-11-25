require 'rails_helper'

RSpec.describe Want, type: :model do
  describe '見たい登録' do
    before do 
      @want = FactoryBot.build(:want)
    end

    context '登録できるとき' do
      it 'userとanimeが紐付いていれば登録できる' do
        expect(@want).to be_valid
      end
    end

    context '登録できないとき' do
      it 'userと紐付いていないと登録できない' do
        @want.user = nil
        @want.valid?
        expect(@want.errors.full_messages).to include("User must exist")
      end

      it 'animeと紐付いていないと登録できない' do
        @want.anime = nil
        @want.valid?
        expect(@want.errors.full_messages).to include("Anime must exist")
      end

      it 'userとanimeが重複していたら登録できない' do
        @want.save
        another_want = FactoryBot.build(:want)
        another_want.user = @want.user
        another_want.anime = @want.anime
        another_want.valid?
        expect(another_want.errors.full_messages).to include("Anime has already been taken")
      end
    end
  end
end
