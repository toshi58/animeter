require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe '新規投稿' do
    before do
      @comment = FactoryBot.build(:comment)
    end

    context '新規投稿できるとき' do
      it 'textが正しく存在すれば投稿できる' do
        expect(@comment).to be_valid
      end
    end

    context '新規投稿できないとき' do
      it 'textが存在しないと投稿できない' do
        @comment.text = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Text can't be blank")
      end

      it 'userと紐付いていないと投稿できない' do
        @comment.user = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include('User must exist')
      end

      it 'reviewと紐付いていないと投稿できない' do
        @comment.review = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include('Review must exist')
      end
    end
  end
end
