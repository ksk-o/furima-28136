require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  describe '商品購入機能' do
    
    before do
      @order_form = FactoryBot.build(:order_form)
    end

    it "すべての値が正しく入力されていれば保存できること" do
      expect(@order_form).to be_valid
    end

    it "postal_codeが空では登録できないこと" do
      @order_form.postal_code = nil
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Postal code can't be blank", "Postal code is invalid")
    end

    it "postal_codeが半角のハイフンを含まなければ保存できないこと" do
      @order_form.postal_code = "1234567"
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Postal code is invalid")
    end

    it "prefecture_idが1では登録できないこと" do
      @order_form.prefecture_id = 1
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Prefecture must be other than 1")
    end

    it "cityが空では登録できないこと" do
      @order_form.city = nil
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("City can't be blank")
    end

    it "blockが空では登録できないこと" do
      @order_form.block = nil
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Block can't be blank")
    end

    it "buildingは空でも登録できること" do
      @order_form.building = nil
      expect(@order_form).to be_valid
    end

    it "phone_numberが空では登録できないこと" do
      @order_form.phone_number = nil
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Phone number can't be blank", "Phone number is invalid")
    end

    it "phone_numberが半角のハイフンを含んでおらず11文字以内でないと保存できないこと" do
      @order_form.phone_number = "090-1234-5678"
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Phone number is invalid")
    end

  end
end


 