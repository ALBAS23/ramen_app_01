require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる' do
      it '全てのデータ（nickname, email, password, password_confirmation）を正しく入力すれば、正常に新規登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordの長さが８文字以上の場合、正常に新規登録できる' do
        @user.password = 'testtest'
        @user.password_confirmation = @user.password
        expect(@user).to be_valid
      end
    end
    context '新規登録できない' do
      it '既に登録されているnicknameを入力した場合、新規登録できない' do
        dummy = FactoryBot.create(:user)
        @user.nickname = dummy.nickname
        @user.valid?
        expect(@user.errors.full_messages).to include('ニックネームは既に登録されています')
      end
      it 'nicknameに全角を含む場合、新規登録できない' do
        @user.nickname = 'やまだ'
        @user.valid?
        expect(@user.errors.full_messages).to include('ニックネームは半角英数字で入力してください')
      end
      it '既に登録されているemailを入力した場合、新規登録できない' do
        dummy = FactoryBot.create(:user)
        @user.email = dummy.email
        @user.valid?
        expect(@user.errors.full_messages).to include('メールアドレスは既に登録されています')
      end
      it 'passwordの長さが半角英数字８文字未満の場合、新規登録できない' do
        @user.password = 'testtes'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは半角英数字８文字以上で入力してください')
      end
      it 'passwordとpassword_confirmationが一致しない場合、新規登録できない' do
        @user.password = 'testtesttest'
        @user.password_confirmation = 'wordwordword'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワード（確認用）とパスワードが一致していません ')
      end
      it 'nicknameが空の場合、新規登録できない' do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include('ニックネームを必ず入力してください')
      end
      it 'emailが空の場合、新規登録できない' do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include('メールアドレスを必ず入力してください')
      end
      it 'passwordが空の場合、新規登録できない' do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードを必ず入力してください')
      end
      it 'password_confirmationが空の場合、新規登録できない' do
        @user.password_confirmation = nil
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワード（確認用）を必ず入力してください')
      end
    end
  end
end
