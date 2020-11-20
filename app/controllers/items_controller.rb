class ItemsController < ApplicationController

  def create
    Item.create(item_params)
  end

  private

  def item_params
    params.require(:item).permit(:content, :image).merge(user_id: current_user.id)
  end

end
