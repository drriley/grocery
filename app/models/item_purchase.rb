class ItemPurchase < ActiveRecord::Base
  belongs_to :purchase
  belongs_to :item_store
  attr_accessible :_id, :item_store_id, :price_per_unit, :purchase, :quantity, :status, :unit
  
   scope :quantityorder, order('quantity')
  
end
