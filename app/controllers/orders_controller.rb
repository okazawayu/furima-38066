class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :item_user

  def index
    @item = Item.find(params[:item_id])
    @order_shipping = OrderShipping.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order_shipping = OrderShipping.new(order_params)
    # binding.pry
    if @order_shipping.valid?
      Payjp.api_key = ENV['PAYJP_SECRET_KEY']
      Payjp::Charge.create(
        amount: @item.price,
        card: order_params[:token],
        currency: 'jpy'
      )
      @order_shipping.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  def order_params
    params.require(:order_shipping).permit(:postal_code, :area_id, :municipalities, :house_number, :building_name, :phone_number).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def item_user
    @item = Item.find(params[:item_id])
    redirect_to root_path if current_user.id == @item.user_id || !@item.order.nil?
  end
end
