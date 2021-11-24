require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe '新規登録のユーザー情報' do
    it 'ニックネームが必須であること。' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'メールアドレスが必須であること。' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it 'メールアドレスが一意性であること。' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    it 'メールアドレスは、@を含む必要があること。' do
    @user.email = "aaaaaa"
    @user.valid?
    expect(@user.errors.full_messages).to include("Email is invalid")
    end
    it 'パスワードが必須であること。' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'パスワードは、6文字以上での入力が必須であること' do
      @user.password = '00000'
      @user.password_confirmation = '00000'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it 'パスワードは、半角英数字混合での入力が必須であること' do
      @user.password = "aaaaaa"
      @user.password_confirmation = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid. Include both letters and numbers")
    end
    it 'パスワードとパスワード（確認）は、値の一致が必須であること。' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
  end

  describe '新規登録の本人情報確認' do
    it 'お名前(全角)は、名字と名前がそれぞれ必須であること。' do
      @user.last_name = ""
      @user.first_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank","First name can't be blank")
    end
    it 'お名前(全角)は、全角（漢字・ひらがな・カタカナ）での入力が必須であること。' do
      @user.last_name = "aaa"
      @user.first_name = "aaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name full-width characters", "First name full-width characters")
    end
    it 'お名前カナ(全角)は、名字と名前がそれぞれ必須であること。' do
      @user.last_name_kana = ""
      @user.first_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank","First name kana can't be blank")
    end
    it 'お名前カナ(全角)は、全角（カタカナ）での入力が必須であること。' do
      @user.last_name_kana = "あああ"
      @user.first_name_kana = "あああ"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana Input full-width katakana characters","First name kana Input full-width katakana characters")
    end
    it '生年月日が必須であること。' do
      @user.birth = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth can't be blank")
    end
  end
end