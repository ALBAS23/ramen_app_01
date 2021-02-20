require 'rails_helper'

RSpec.describe Person, type: :model do
  before do
    @person = FactoryBot.build(:person)
  end
  describe 'マイページ情報登録' do
    context '登録できる場合' do
      it 'お気に入り店舗①, 好きなジャンル, 好きなトッピング（必須項目）が登録されていれば、マイページ情報を登録できる（任意項目は空の状態である）' do
        @person.gender = nil
        @person.prefecture_id = 1
        @person.f_store_two = nil
        @person.f_store_three = nil
        @person.self_introduction = nil
        expect(@person).to be_valid
      end
      it '自己紹介文を登録する場合、文字数が400字以内であれば、登録できる' do
        @person.self_introduction = Faker::Lorem.characters(number: 400)
        expect(@person).to be_valid
      end
      it '全ての情報が入力されている場合、マイページ情報を登録できる' do
        expect(@person).to be_valid
      end
    end

    context '登録できない場合' do
      it 'お気に入り店舗①が空の場合、登録できない' do
        @person.f_store_one = nil
        @person.valid?
        expect(@person.errors.full_messages).to include('お気に入り店舗①を必ず入力してください')
      end
      it '好きなジャンルが空（ genre_id = 1 ）の場合、登録できない' do
        @person.genre_id = 1
        @person.valid?
        expect(@person.errors.full_messages).to include('好きなジャンルを必ず入力してください')
      end
      it '好きなトッピングが空の場合、登録できない' do
        @person.f_topping = nil
        @person.valid?
        expect(@person.errors.full_messages).to include('好きなトッピングを必ず入力してください')
      end
      it '自己紹介文が401文字以上の場合、登録できない' do
        @person.self_introduction = Faker::Lorem.characters(number: 401)
        @person.valid?
        expect(@person.errors.full_messages).to include('自己紹介文は400文字以下で入力してください')
      end
      it 'ユーザーモデルに紐付いていない場合、登録できない' do
        @person.user = nil
        @person.valid?
        expect(@person.errors.full_messages).to include('Userを入力してください')
      end
    end
  end
end
