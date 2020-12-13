class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_order
  before_action :set_order_item

  def index
    @order_form = OrderForm.new
  end

  def create
    @order_form = OrderForm.new(order_form_params)
     if 
       @order_form.valid?
       pay_item
       @order_form.save
       redirect_to root_path
     else
       render action: :index
     end
  end

  private

  def order_form_params
   params.require(:order_form).permit(
     :postal_code, 
     :prefecture_id, 
     :city, 
     :block, 
     :building, 
     :phone_number,
     :order_id
    ).merge(
      user_id: current_user.id, 
      item_id: params[:item_id], 
      token:   params[:token]
    )
  end
  
  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @order_item.price,
      card: order_form_params[:token],
      currency: 'jpy'
    )
  end

  def correct_order
    item = Item.find(params[:item_id])
     if current_user.id == item.user_id || item.order.present?
       redirect_to root_path
     end
  end

  def set_order_item
    @order_item = Item.find(params[:item_id])
  end

end