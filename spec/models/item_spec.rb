require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end


  describe '商品出品機能のテスト' do
    it '必要な情報を適切に入力して「出品する」ボタンを押すと、商品情報がデータベースに保存されること。' do
      expect(@item).to be_valid
    end
    it '商品画像を1枚つけることが必須であること。' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it '商品名が必須であること。' do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end
    it '商品の説明が必須であること。' do
      @item.explanation = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Explanation can't be blank")
    end
    it 'カテゴリーの情報が必須であること。' do
      @item.category_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end
    it '商品の状態の情報が必須であること。' do
      @item.condition_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Condition can't be blank")
    end
    it '配送料の負担の情報が必須であること。' do
      @item.shipping_cost_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping cost can't be blank")
    end
    it '発送元の地域の情報が必須であること。' do
      @item.shipping_area_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping area can't be blank")
    end
    it '発送までの日数の情報が必須であること。' do
      @item.shipping_time_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping time can't be blank")
    end
    it '価格の情報が必須であること。' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it '価格は、¥300~¥9,999,999の間のみ保存可能であること。' do
      @item.price = 100
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
    end
    it '価格は、¥300~¥9,999,999の間のみ保存可能であること。' do
      @item.price = 100000000
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
    end
    it '価格は半角数値のみ保存可能であること。' do
      @item.price = '１１１１１１'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end
  end
end