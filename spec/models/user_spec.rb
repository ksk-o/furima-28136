require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end

    it "nickname,email,password,password_confirmation,last_name,first_name,last_name_furigana,first_name_furigana,birthdayが存在すれば登録できること" do
      expect(@user).to be_valid
    end

    it "nicknameが空では登録できないこと" do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it "emailが空では登録できないこと" do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it "emailに@がないと登録できない事" do
      @user.email = "testmail.com"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end

    it "重複したemailが存在する場合登録できないこと" do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end

    it "passwordが空では登録できないこと" do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it "passwordが存在してもpassword_confirmationが空では登録できないこと" do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "passwordが5文字以下であれば登録できないこと" do
      @user.password = "ab123"
      @user.password_confirmation = "ab123"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end

    it "passwordが全角では登録できないこと" do
      @user.password = "ａｂｃ１２３"
      @user.password_confirmation = "ａｂｃ１２３"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end

    it "passwordが半角数字のみでは登録できないこと" do
      @user.password = "123456"
      @user.password_confirmation = "1234546"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end

    it "passwordが半角英字のみでは登録できないこと" do
      @user.password = "abcdef"
      @user.password_confirmation = "abcdef"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end

    it "last_nameが空では登録できないこと" do
      @user.last_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank", "Last name is invalid")
    end

    it "last_nameが全角（漢字・ひらがな・カタカナ）以外では登録できないこと" do
      @user.last_name = "ｱｲｳ"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name is invalid")
    end

    it "first_nameが空では登録できないこと" do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank", "First name is invalid")
    end

    it "first_nameが全角（漢字・ひらがな・カタカナ）以外では登録できないこと" do
      @user.first_name = "ｱｲｳ"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid")
    end

    it "last_name_furiganaが空では登録できないこと" do
      @user.last_name_furigana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name furigana can't be blank", "Last name furigana is invalid")
    end

    it "last_name_furiganaが全角（カタカナ）以外では登録できないこと" do
      @user.last_name_furigana = "あいうえお"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name furigana is invalid")
    end

    it "first_name_furiganaが空では登録できないこと" do
      @user.first_name_furigana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name furigana can't be blank", "First name furigana is invalid")
    end

    it "first_name_furiganaが全角（カタカナ）以外では登録できないこと" do
      @user.first_name_furigana = "あいうえお"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name furigana is invalid")
    end

    it "birthdayが空では登録できないこと" do
      @user.birthday = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end

  end
end
