require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @post = FactoryBot.build(:post)
  end

  context '新規投稿できない' do
    it 'メニューが空の場合、新規投稿できない' do
      @post.menu = nil
      @post.valid?
      expect(@post.errors.full_messages).to include("メニューを必ず入力してください")
    end
    it '店舗名が空の場合、新規投稿できない' do
      @post.store = nil
      @post.valid?
      expect(@post.errors.full_messages).to include("店舗を必ず入力してください")
    end
    it '値段が空の場合、新規投稿できない' do
      @post.price = nil
      @post.valid?
      expect(@post.errors.full_messages).to include("値段を必ず入力してください")
    end
    it 'ジャンルが空の場合（genre_id = 1）、新規投稿できない' do
      @post.genre_id = 1
      @post.valid?
      expect(@post.errors.full_messages).to include("ジャンルは必ず入力してください")
    end
    it 'ひとコトが空の場合、新規投稿できない' do
      @post.word = nil
      @post.valid?
      expect(@post.errors.full_messages).to include("ひとコトを必ず入力してください")
    end
    it '都道府県が空の場合（prefecture_id = 1）、新規投稿できない' do
      @post.prefecture = nil
      @post.valid?
      expect(@post.errors.full_messages).to include("都道府県は必ず入力してください")
    end
    it '値段が全角の場合、新規投稿できない' do
      @post.price = "９８０"
      @post.valid?
      expect(@post.errors.full_messages).to include("値段は半角数字で入力してください")
    end
    it '値段が英数字の場合、新規投稿できない' do
      @post.price = "asdafe"
      @post.valid?
      expect(@post.errors.full_messages).to include("値段は半角数字で入力してください")
    end
    it 'ユーザーに紐付いていない場合、新規投稿できない' do
      @post.user = nil
      @post.valid?
      expect(@post.errors.full_messages).to include("Userを入力してください")
    end
  end
end
