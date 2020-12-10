class OrdersController < ApplicationController

  def index
    @order_item = Item.find(params[:item_id])
    @order_form = OrderForm.new
  end

  def create
    @order_form = OrderForm.new(order_form_params)
     if 
       @order_form.valid?
       @order_form.save
       redirect_to root_path
     else
       @order_item = Item.find(params[:item_id])
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
    ).merge(user_id: current_user.id, item_id: params[:item_id])
  end
  
end