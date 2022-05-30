require 'rails_helper'

RSpec.describe Performance, type: :model do
  before do
    @performance = FactoryBot.build(:performance)
  end

  describe '公演出品機能' do
    context '出品できるとき' do
      it 'nameとtheater、start_dayとlast_day、infoとprice、imageが存在すれば登録できる' do
        expect(@performance).to be_valid
      end
    end
    context '出品できないとき' do
      it 'nameが空では出品できない' do
        @performance.name = ''
        @performance.valid?
        expect(@performance.errors.full_messages).to include("Name can't be blank")
      end
      it 'theaterが空では出品できない' do
        @performance.theater = ''
        @performance.valid?
        expect(@performance.errors.full_messages).to include("Theater can't be blank")
      end
      it 'start_dayが空では出品できない' do
        @performance.start_day = ''
        @performance.valid?
        expect(@performance.errors.full_messages).to include("Start day can't be blank")
      end
      it 'start_dayが今日以降じゃないと出品できない' do
        @performance.start_day = '2020/10/01'
        @performance.valid?
        expect(@performance.errors.full_messages).to include('Start day は今日以降のものを選択してください')
      end
      it 'last_dayが空では出品できない' do
        @performance.last_day = ''
        @performance.valid?
        expect(@performance.errors.full_messages).to include("Last day can't be blank")
      end
      it 'last_dayがstart_day以降じゃないと出品できない' do
        @performance.start_day = '2040/10/01'
        @performance.last_day = '2040/09/01'
        @performance.valid?
        expect(@performance.errors.full_messages).to include('Last day は初日以降のものを選択してください')
      end
      it 'infoが空では出品できない' do
        @performance.info = ''
        @performance.valid?
        expect(@performance.errors.full_messages).to include("Info can't be blank")
      end
      it 'priceが空では出品できない' do
        @performance.price = ''
        @performance.valid?
        expect(@performance.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが数字じゃないと出品できない' do
        @performance.price = 'aaa'
        @performance.valid?
        expect(@performance.errors.full_messages).to include('Price is not a number')
      end
      it 'imageが空では出品できない' do
        @performance.image = nil
        @performance.valid?
        expect(@performance.errors.full_messages).to include("Image can't be blank")
      end
      it 'admin_userが紐づいていないと出品できない' do
        @performance.admin_user = nil
        @performance.valid?
        expect(@performance.errors.full_messages).to include('Admin user must exist')
      end
    end
  end
end
