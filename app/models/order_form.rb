class OrderForm

  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :block, :building, :phone_number, :item_id, :user_id, :token

  with_options presence: true do
    validates :postal_code,   format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :city
    validates :block
    validates :phone_number,  format: { with: /\A\d{11}\z/ }
    validates :user_id
    validates :item_id
    validates :token
  end
  validates :prefecture_id, numericality: { other_than: 1 }
    
  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(
      postal_code: postal_code, 
      prefecture_id: prefecture_id, 
      city: city, 
      block: block, 
      building: building, 
      phone_number: phone_number,
      order_id: order.id
    )
  end

end