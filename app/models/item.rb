class Item < ApplicationRecord
  belongs_to :user
  has_one :purchase
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :postage
  belongs_to_active_hash :shipping_plase
  belongs_to_active_hash :ship_date
  
  # with_options presence: true do
  #   validates :name,               
  #   validates :description,        
  #   validates :category_id,        numericality: { other_than: 1 }, 
  #   validates :condition_id,       numericality: { other_than: 1 }, 
  #   validates :postage_id,         numericality: { other_than: 1 }, 
  #   validates :shipping_plase_id,  numericality: { other_than: 1 }, 
  #   validates :ship_date_id,       numericality: { other_than: 1 }, 
  #   validates :price,              
  # end

end
