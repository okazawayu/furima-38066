require 'rails_helper'

RSpec.describe OrderShipping, type: :model do
  before do
    @user = FactoryBot.build(:user)
    @item = FactoryBot.build(:item)
    @order_shipping = FactoryBot.build(:order_shipping)
    @order_shipping.user_id = @user.id
    @order_shipping.item_id = @item.id
  end

  describe '配送先情報の保存' do
    context '配送先情報の保存ができるとき' do
      it 'すべての値が正しく入力されていれば保存できる' do
        expect(@order_shipping).to be_valid
      end
      it 'user_idが空でなければ保存できる' do
        @order_shipping.user_id = 1
        expect(@order_shipping).to be_valid
      end
      it 'item_idが空でなければ保存できる' do
        @order_shipping.item_id = 1
        expect(@order_shipping).to be_valid
      end
      it '郵便番号が「3桁＋ハイフン＋4桁」の組み合わせであれば保存できる' do
        @order_shipping.postal_code = '123-4560'
        expect(@order_shipping).to be_valid
      end
      it '都道府県が「---」以外かつ空でなければ保存できる' do
        @order_shipping.area_id = 2
        expect(@order_shipping).to be_valid
      end
      it '市区町村が空でなければ保存できる' do
        @order_shipping.municipalities = '横浜市'
        expect(@order_shipping).to be_valid
      end
      it '番地が空でなければ保存できる' do
        @order_shipping.house_number = '旭区１２３'
        expect(@order_shipping).to be_valid
      end
      it '建物名が空でも保存できる' do
        @order_shipping.building_name = nil
        expect(@order_shipping).to be_valid
      end
      it '電話番号が11番桁以内かつハイフンなしであれば保存できる' do
        @order_shipping.phone_number = '12345678901'
        expect(@order_shipping).to be_valid
      end
    end

    context '配送先情報の保存ができないとき' do
      it 'user_idが空だと保存できない' do
        @order_shipping.user_id = nil
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空だと保存できない' do
        @order_shipping.item_id = nil
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Item can't be blank")
      end
      it '郵便番号が空だと保存できない' do
        @order_shipping.postal_code = nil
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Postal code can't be blank")
      end
      it '郵便番号にハイフンがないと保存できない' do
        @order_shipping.postal_code = '1234567'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
      it '都道府県が「---」だと保存できない' do
        @order_shipping.area_id = 1
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Area can't be blank")
      end
      it '都道府県が空だと保存できない' do
        @order_shipping.area_id = nil
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Area can't be blank")
      end
      it '市区町村が空だと保存できない' do
        @order_shipping.municipalities = nil
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Municipalities can't be blank")
      end
      it '番地が空だと保存できない' do
        @order_shipping.house_number = nil
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("House number can't be blank")
      end
      it '電話番号が空だと保存できない' do
        @order_shipping.phone_number = nil
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号にハイフンがあると保存できない' do
        @order_shipping.phone_number = '123-1234-1234'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include('Phone number is invalid')
      end
      it '電話番号が12桁以上あると保存できない' do
        @order_shipping.phone_number = '12345678910123'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include('Phone number is invalid')
      end
      it '電話番号が9桁以下では保存できない' do
        @order_shipping.phone_number = '123456789'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include('Phone number is invalid')
      end
      it 'トークンが空だと保存できない' do
        @order_shipping.token = nil
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
