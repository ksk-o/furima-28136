class Item < ApplicationRecord
  belongs_to :user
  has_one :purchase

  # with_options presence: true do
  #   validates :name,               
  #   validates :description,        
  #   validates :category_id,        
  #   validates :condition_id,       
  #   validates :postage_id,         
  #   validates :shipping_plase_id,  
  #   validates :ship_date_id,       
  #   validates :price,              
  # end

end
