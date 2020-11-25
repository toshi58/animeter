require 'rails_helper'

RSpec.describe Review, type: :model do
  describe '新規投稿' do
    before do
      @review = FactoryBot.build(:review)
    end
    
    context '新規投稿できるとき' do
      it 'textが正しく存在すれば投稿できる' do
        expect(@review).to be_valid
      end
    end

    context '新規投稿できないとき' do
      it 'textが存在しないと投稿できない' do
        @review.text = nil
        @review.valid?
        expect(@review.errors.full_messages).to include("Text can't be blank")
      end

      it 'userと紐付いていないと投稿できない' do
        @review.user = nil
        @review.valid?
        expect(@review.errors.full_messages).to include("User must exist")
      end

      it 'animeと紐付いていないと投稿できない' do
        @review.anime = nil
        @review.valid?
        expect(@review.errors.full_messages).to include("Anime must exist")
      end
    end
  end
end
