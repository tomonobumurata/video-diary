require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる時' do
      it '全ての項目が正しく存在すれば登録できる' do
        expect(@user).to be_valid
      end

      it 'passwordとpassword_confirmationが6文字以上であれば登録できる' do
        @user.password = '12345a'
        @user.password_confirmation = '12345a'
        expect(@user).to be_valid
      end

      it 'introductionが空でも登録できる' do
        @user.introduction = ''
        expect(@user).to be_valid
      end
    end

    context '新規登録できない時' do
      it 'nicknameが空の場合は登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'emailが空の場合は登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it 'passwordが空の場合は登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'password_confirmationが空の場合は登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'full_nameが空の場合は登録できない' do
        @user.full_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Full name can't be blank")
      end

      it 'full_name_kanaがからの場合は登録できない' do
        @user.full_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Full name kana can't be blank")
      end

      it 'birthdayが空の場合は登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end

      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end

      it 'emaiに@がない場合は登録できない' do
        @user.email = 'testtest.com'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end

      it 'passwordが5文字以下の場合は登録できない' do
        @user.password = 'test1'
        @user.password_confirmation = 'test1'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end

      it 'passwordが半角数字のみの場合は登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end

      it 'passwordが半角英字のみの場合は登録できない' do
        @user.password = 'testtest'
        @user.password_confirmation = 'testtest'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end

      it 'passwordとpassword_confirmationが一致しない場合は登録できない' do
        @user.password = 'test12'
        @user.password_confirmation = 'test123'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'full_name_kanaが英語の場合登録できない' do
        @user.full_name_kana = 'testkunn'
        @user.valid?
        expect(@user.errors.full_messages).to include("Full name kana is invalid")
      end

      it 'full_name_kanaがひらがなの場合登録できない' do
        @user.full_name_kana = 'てすとくん'
        @user.valid?
        expect(@user.errors.full_messages).to include("Full name kana is invalid")
      end
    end
  end
end
