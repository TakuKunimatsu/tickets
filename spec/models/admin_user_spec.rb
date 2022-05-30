require 'rails_helper'

RSpec.describe AdminUser, type: :model do
  before do
    @admin_user = FactoryBot.build(:admin_user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'company_nameとemail、passwordとpassword_confirmationが存在すれば登録できる' do
        expect(@admin_user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'company_nameが空では登録できない' do
        @admin_user.company_name = ''
        @admin_user.valid?
        expect(@admin_user.errors.full_messages).to include("Company name can't be blank")
      end
      it 'emailが空では登録できない' do
        @admin_user.email = ''
        @admin_user.valid?
        expect(@admin_user.errors.full_messages).to include("Email can't be blank")
      end
      it 'passwordが空では登録できない' do
        @admin_user.password = ''
        @admin_user.valid?
        expect(@admin_user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @admin_user.password_confirmation = ''
        @admin_user.valid?
        expect(@admin_user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it '重複したemailが存在する場合は登録できない' do
        @admin_user.save
        another_admin_user = FactoryBot.build(:admin_user)
        another_admin_user.email = @admin_user.email
        another_admin_user.valid?
        expect(another_admin_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailは@を含まないと登録できない' do
        @admin_user.email = 'testmail'
        @admin_user.valid?
        expect(@admin_user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが5文字以下では登録できない' do
        @admin_user.password = 'a0000'
        @admin_user.password_confirmation = 'a0000'
        @admin_user.valid?
        expect(@admin_user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが129文字以上では登録できない' do
        @admin_user.password = Faker::Lorem.characters(number: 129, min_alpha: 1, min_numeric: 1)
        @admin_user.password_confirmation = @admin_user.password
        @admin_user.valid?
        expect(@admin_user.errors.full_messages).to include('Password is too long (maximum is 128 characters)')
      end
      it 'passwordが数字のみでは登録できない' do
        @admin_user.password = '000000'
        @admin_user.password_confirmation = '000000'
        @admin_user.valid?
        expect(@admin_user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
      end
      it 'passwordが英字のみでは登録できない' do
        @admin_user.password = 'aaaaaa'
        @admin_user.password_confirmation = 'aaaaaa'
        @admin_user.valid?
        expect(@admin_user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
      end
    end
  end
end
