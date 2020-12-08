require 'rails_helper'

RSpec.describe Like, type: :model do
  describe 'お気に入り登録' do
    before do
      @like = FactoryBot.build(:like)
    end

    context '登録できるとき' do
      it 'userとanimeが紐付いていれば登録できる' do
        expect(@like).to be_valid
      end
    end

    context '登録できないとき' do
      it 'userと紐付いていないと登録できない' do
        @like.user = nil
        @like.valid?
        expect(@like.errors.full_messages).to include('User must exist')
      end

      it 'animeと紐付いていないと登録できない' do
        @like.anime = nil
        @like.valid?
        expect(@like.errors.full_messages).to include('Anime must exist')
      end

      it 'userとanimeが重複していたら登録できない' do
        @like.save
        another_like = FactoryBot.build(:like)
        another_like.user = @like.user
        another_like.anime = @like.anime
        another_like.valid?
        expect(another_like.errors.full_messages).to include('Anime has already been taken')
      end
    end
  end
end
