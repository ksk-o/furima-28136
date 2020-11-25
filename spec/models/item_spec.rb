require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品出品機能' do
    before do
      @item = FactoryBot.build(:item)
    end

    it "image,name,description,category_id,condition_id,postage_id,shipping_plase_id,ship_date_id,priceが存在すれば登録できること" do
      expect(@item).to be_valid
    end

    it "imageが空では登録できないこと" do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it "nameが空では登録できないこと" do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it "descriptionが空では登録できないこと" do
      @item.description = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end

    it "category_idが1では登録できないこと" do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Category must be other than 1")
    end

    it "condition_idが1では登録できないこと" do
      @item.condition_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Condition must be other than 1")
    end

    it "postage_idが1では登録できないこと" do
      @item.postage_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Postage must be other than 1")
    end

    it "shipping_plase_idが1では登録できないこと" do
      @item.shipping_plase_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping plase must be other than 1")
    end

    it "ship_date_idが1では登録できないこと" do
      @item.ship_date_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Ship date must be other than 1")
    end

    it "priceが空では登録できないこと" do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it "priceが半角数字以外では登録できないこと" do
      @item.price = "１０００"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end

    it "priceが299円以下では登録できないこと" do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
    end

    it "priceが10,000,000円以上では登録できないこと" do
      @item.price = 10000000
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
    end

    it "ユーザーがログインしていないと商品情報は保存できない" do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("User must exist")
    end

  end  
end