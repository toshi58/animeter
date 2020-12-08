require 'rails_helper'

RSpec.describe Watch, type: :model do
  describe '見た登録' do
    before do
      @watch = FactoryBot.build(:watch)
    end

    context '登録できるとき' do
      it 'userとanimeが紐付いていれば登録できる' do
        expect(@watch).to be_valid
      end
    end

    context '登録できないとき' do
      it 'userと紐付いていないと登録できない' do
        @watch.user = nil
        @watch.valid?
        expect(@watch.errors.full_messages).to include('User must exist')
      end

      it 'animeと紐付いていないと登録できない' do
        @watch.anime = nil
        @watch.valid?
        expect(@watch.errors.full_messages).to include('Anime must exist')
      end

      it 'userとanimeが重複していたら登録できない' do
        @watch.save
        another_watch = FactoryBot.build(:watch)
        another_watch.user = @watch.user
        another_watch.anime = @watch.anime
        another_watch.valid?
        expect(another_watch.errors.full_messages).to include('Anime has already been taken')
      end
    end
  end
end
